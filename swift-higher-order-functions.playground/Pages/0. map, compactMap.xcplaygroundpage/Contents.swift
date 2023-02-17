// MARK: - Imperative Way

let numbers = [1, 2, 3]
var asStrings = [String]()

for number in numbers {
    
    asStrings.append(String(number))
}

asStrings

// MARK: - Functional Way

// MARK: Map

// func map<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T]
// func map<T>(_ transform: (Self.Element) -> T) -> [T]

// long
[1, 2, 3]
    .map { int in
        
        String(int)
    }

// shorter
[1, 2, 3]
    .map { String($0) }

// short ("point free")
[1, 2, 3]
    .map(String.init)

let strings = ["1", "one", "2", "two", "3", "three"]

// array of optionals
let ints0 = strings
    .map(Int.init)

// filtered array of optionals
let ints = strings
    .map(Int.init)
    .filter { $0 != nil }

type(of: ints)

// MARK: CompactMap

// array of honest Int
let ints2 = strings
    .compactMap(Int.init)

type(of: ints2)
