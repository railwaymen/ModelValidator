**EXTENSION**

# `Validator`
```swift
extension Validator where T: Collection, T.Element: Equatable
```

## Methods
### `contains(_:)`

```swift
public static func contains(_ element: T.Element) -> Validator<T>
```

> Checks if the validated collection contains the given element.
>
> - Parameter element: An element which have to be in the validated collection.

#### Parameters

| Name | Description |
| ---- | ----------- |
| element | An element which have to be in the validated collection. |

### `count(_:)`

```swift
public static func count(_ range: Range<Int>) -> Validator<T>
```

> Checks if the count of the validated collection is in the given range.
>
> - Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: ClosedRange<Int>) -> Validator<T>
```

> Checks if the count of the validated collection is in the given range.
>
> - Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: PartialRangeUpTo<Int>) -> Validator<T>
```

> Checks if the count of the validated collection is in the given range.
>
> - Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: PartialRangeThrough<Int>) -> Validator<T>
```

> Checks if the count of the validated collection is in the given range.
>
> - Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: PartialRangeFrom<Int>) -> Validator<T>
```

> Checks if the count of the validated collection is in the given range.
>
> - Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ count: Int) -> Validator<T>
```

> Checks if the count of the validated collection if equal to the given value.
>
> - Parameter count: A required collections' count.

#### Parameters

| Name | Description |
| ---- | ----------- |
| count | A required collections’ count. |

### `in(_:)`

```swift
public static func `in`(_ array: T...) -> Validator<T>
```

> Checks if the validated value is contained in the given array.
>
> - Parameter array: An array of permitted values.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | An array of permitted values. |

### `in(_:)`

```swift
public static func `in`(_ array: [T]) -> Validator<T>
```

> Checks if the validated value is contained in the given array.
>
> - Parameter array: An array of permitted values.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | An array of permitted values. |

### `in(_:)`

```swift
public static func `in`(_ set: Set<T>) -> Validator<T>
```

> Checks if the validated value is contained in the given set.
>
> - Parameter array: A set of permitted values.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | A set of permitted values. |

### `inRange(_:)`

```swift
public static func inRange(_ range: ClosedRange<T>) -> Validator<T>
```

> Checks if the validated value is in the given range
>
> - Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: Range<T>) -> Validator<T>
```

> Checks if the validated value is in the given range
>
> - Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: PartialRangeThrough<T>) -> Validator<T>
```

> Checks if the validated value is in the given range
>
> - Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: PartialRangeUpTo<T>) -> Validator<T>
```

> Checks if the validated value is in the given range
>
> - Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: PartialRangeFrom<T>) -> Validator<T>
```

> Checks if the validated value is in the given range
>
> - Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `regexp(_:caseInsensitive:)`

```swift
public static func regexp(_ regexp: String, caseInsensitive: Bool = false) -> Validator<T>
```

> Checks if at least part of the string fits the given regular expression.
>
> If you want to check if whole string fits the regexp, start it with `^` and end with `$`.
>
> - Parameters:
>   - regexp: A regular expression for validation.
>   - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| regexp | A regular expression for validation. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |