import Combine
import Foundation

final class FileEditor {
    
    let action: AnyPublisher<Action, Never>
    
    init(action: AnyPublisher<Action, Never>) {
        self.action = action
        
        bind()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    /// Observe:
    /// - open txt files
    /// - close files
    private func bind() {
        
        action
            .compactMap { $0 as? FileAction.Open }
            .handleEvents(
                receiveSubscription: <#T##((Subscription) -> Void)?##((Subscription) -> Void)?##(Subscription) -> Void#>,
                receiveOutput: { value in
                    LoggerAgent.shared.log(.debug, .ui, "sdfsdf \(value.file.name).\(value.file.ext)")
                },
                receiveCompletion: <#T##((Subscribers.Completion<Never>) -> Void)?##((Subscribers.Completion<Never>) -> Void)?##(Subscribers.Completion<Never>) -> Void#>,
                receiveCancel: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>,
                receiveRequest: <#T##((Subscribers.Demand) -> Void)?##((Subscribers.Demand) -> Void)?##(Subscribers.Demand) -> Void#>)
            .map(\.file)
            .print(<#T##prefix: String##String#>, to: <#T##TextOutputStream?#>)
            .filter { $0.ext == "asdasdfg" }
            .receive(on: DispatchQueue.main)
            .sink { print("Opened file named", "\"\($0.name)\"") }
            .store(in: &cancellables)
        
//       let openTxtFiles = action
//            .compactMap { $0 as? FileAction.Open }
//            .map(\.file)
//            .filter { $0.ext == "txt" }
//
//        openTxtFiles
//            .receive(on: DispatchQueue.main)
//            .sink { print("Opened file named", "\"\($0.name)\"") }
//            .store(in: &cancellables)
        
#warning("uncomment to see `Close` action")
        action
            .compactMap { $0 as? FileAction.Close }
            .receive(on: DispatchQueue.main)
            .sink { _ in print("Closed file") }
            .store(in: &cancellables)
    }
}

let action = PassthroughSubject<Action, Never>()
let fileEditor = FileEditor(action: action.eraseToAnyPublisher())

action.send(FileAction.Open(.init(name: "apple", ext: "txt"))) // ✅
action.send(FileAction.Open(.init(name: "google", ext: "png"))) // ❌
action.send(FileAction.Close()) // ✅ OR ❌ depending on commented code
action.send(FileAction.Lock()) // ❌
