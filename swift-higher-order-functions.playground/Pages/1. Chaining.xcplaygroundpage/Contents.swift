let strings = ["1", "one", "2", "two", "3", "three"]

strings
    .map { $0.uppercased() }
    .filter { $0.count < 3 }
    .dropLast()
    .compactMap(Int.init)
