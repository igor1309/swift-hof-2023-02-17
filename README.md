# Higher Order Functions

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
- mapError()
- flatMapError

# References

[Swift `Sequence` protocol](https://developer.apple.com/documentation/swift/sequence)

[Key points - a free Hacking with Swift tutorial](https://www.hackingwithswift.com/guide/ios-swiftui/7/2/key-points)

[Understanding Higher Order Functions in Swift | AppCoda](https://www.appcoda.com/higher-order-functions-swift/)

[Using Combine by Joseph Heck](https://heckj.github.io/swiftui-notes/)
