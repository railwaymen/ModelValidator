**EXTENSION**

# `Collection`
```swift
extension Collection where Element: Equatable
```

## Methods
### `contains(_:)`

```swift
public func contains<T: Collection>(_ other: T) -> Bool where T.Element == Element
```

Checks if the collection contains other collection in its order.

Code from: https://forums.swift.org/t/count-of-and-contains-other-for-collection/11245
