import Combine

struct ParseError: Error {}

let cancellable = ["1", "one", "2", "two", "3", "three"].publisher
    .tryMap { text in
        
        if let number = Int(text) {
            return number
        } else {
            throw ParseError()
        }
    }
    .print()
    .sink {
        print($0)
    } receiveValue: {
        print($0)
    }
