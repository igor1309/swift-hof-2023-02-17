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
            .receive(on: DispatchQueue.main)
            .sink { action in
                
                switch action {
                case let openAction as FileAction.Open:
                    
                    let file = openAction.file
                    
                    switch file.ext {
                    case "txt":
                        print("Opened file named", "\"\(file.name)\"")
                        
                    default:
                        // do not open
                        break
                    }
                    
                case _ as FileAction.Close:
                    print("Closed file")
                    
                default:
                    break
                }
            }
            .store(in: &cancellables)
    }
}

let action = PassthroughSubject<Action, Never>()
let fileEditor = FileEditor(action: action.eraseToAnyPublisher())

action.send(FileAction.Open(.init(name: "apple", ext: "txt"))) // ✅
action.send(FileAction.Open(.init(name: "google", ext: "png"))) // ❌
action.send(FileAction.Close()) // ✅
action.send(FileAction.Lock()) // ❌
