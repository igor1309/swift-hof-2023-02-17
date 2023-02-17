import Combine

let cancellable = ["1", "one", "2", "two", "3", "three"]
    .publisher
    .compactMap(Int.init)
    .filter { $0 < 3 }
    .sink { print($0) }
