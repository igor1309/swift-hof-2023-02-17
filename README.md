# Higher Order Functions

> In mathematics and computer science, a higher-order function (HOF) is a function that does at least one of the following: takes one or more functions as arguments (i.e. a procedural parameter, which is a parameter of a procedure that is itself a procedure), returns a function as its result

f(g: (A) -> B)

f() -> (A) -> B

## Sequence

(Array, ArraySlice, Range, CloseRange, String, Dictionary, Set,...)

Transforming a Sequence

    (A) -> B | ([A]) -> [B]

- map
- compactMap
- flatMap
- reduce
- sort

Finding Elements
- contains
- allSatisfy
- first
- min(by:), max(by:)

Selecting Elements
- prefix(while:)

Excluding Elements
- drop(while:)
- filter

...

## Optional
- map
- flatMap

## Result
- map
- flatMap
- mapError
- flatMapError

# References

[Swift `Sequence` protocol](https://developer.apple.com/documentation/swift/sequence)

[Key points - a free Hacking with Swift tutorial](https://www.hackingwithswift.com/guide/ios-swiftui/7/2/key-points)

[Understanding Higher Order Functions in Swift | AppCoda](https://www.appcoda.com/higher-order-functions-swift/)

[Using Combine by Joseph Heck](https://heckj.github.io/swiftui-notes/)
