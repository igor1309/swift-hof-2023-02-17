import Combine
import Foundation

final class FileEditor {
    
    @Published private(set) var title: String = ""
    
    let action: AnyPublisher<Action, Never>
    
    init(action: AnyPublisher<Action, Never>) {
        self.action = action
        
        bind()
    }
    
    private func bind() {
        
        action
            .compactMap { $0 as? FileAction.Open }
            .map(\.file)
            .filter { $0.ext == "txt" }
            .map(\.name)
            .assign(to: &$title)
    }
}

let action = PassthroughSubject<Action, Never>()
let fileEditor = FileEditor(action: action.eraseToAnyPublisher())
let cancellable = fileEditor.$title
    .dropFirst()
    .sink { print("title:", $0) }

action.send(FileAction.Open(.textFile(named: "apple"))) // ✅
action.send(FileAction.Open(.textFile(named: "google"))) // ✅
action.send(FileAction.Open(.textFile(named: "fora"))) // ✅
