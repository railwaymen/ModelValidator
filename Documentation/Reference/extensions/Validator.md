**EXTENSION**

# `Validator`
```swift
extension Validator
```

## Methods
### `&&(_:_:)`

```swift
public static func && (lhs: Validator, rhs: Validator) -> Validator
```

Connects two validators with AND.

Example:
```
let validator: Validator<String> = .email && .count(...64)
```
Checks if the validated value is a valid email and the string has no more than 64 characters.

### `contains(_:)`

```swift
public static func contains(_ sequence: T.Element...) -> Validator
```

Checks if the validated collection contains the given elements.

- Parameter sequence: Elements which have to be in the validated collection in the given order.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sequence | Elements which have to be in the validated collection in the given order. |

### `contains(_:)`

```swift
public static func contains(_ sequence: [T.Element]) -> Validator
```

Checks if the validated collection contains the given elements.

- Parameter sequence: Elements which have to be in the validated collection in the given order.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sequence | Elements which have to be in the validated collection in the given order. |

### `contains(_:caseInsensitive:)`

```swift
public static func contains(_ substring: Substring, caseInsensitive: Bool = false) -> Validator
```

Checks if the validated string contains the given substring.

- Parameters:
  - substring: A substring which has to be in the validated string.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| substring | A substring which has to be in the validated string. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |

### `contains(_:caseInsensitive:)`

```swift
public static func contains(_ substring: String, caseInsensitive: Bool = false) -> Validator
```

Checks if the validated string contains the given substring.

- Parameters:
  - substring: A substring which has to be in the validated string.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| substring | A substring which has to be in the validated string. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |

### `count(_:)`

```swift
public static func count(_ range: Range<Int>) -> Validator<T>
```

Checks if the count of the validated collection is in the given range.

- Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: ClosedRange<Int>) -> Validator<T>
```

Checks if the count of the validated collection is in the given range.

- Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: PartialRangeUpTo<Int>) -> Validator<T>
```

Checks if the count of the validated collection is in the given range.

- Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: PartialRangeThrough<Int>) -> Validator<T>
```

Checks if the count of the validated collection is in the given range.

- Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ range: PartialRangeFrom<Int>) -> Validator<T>
```

Checks if the count of the validated collection is in the given range.

- Parameter range: A range in which the collection's count must be.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the collection’s count must be. |

### `count(_:)`

```swift
public static func count(_ count: Int) -> Validator<T>
```

Checks if the count of the validated collection if equal to the given value.

- Parameter count: A required collections' count.

#### Parameters

| Name | Description |
| ---- | ----------- |
| count | A required collections’ count. |

### `ends(with:)`

```swift
public static func ends(with sequence: [T.Element]) -> Validator
```

Checks if the validated collection ends with the given sequence.

- Parameter sequence: A sequence which should be at the end of the validated collection.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sequence | A sequence which should be at the end of the validated collection. |

### `ends(with:)`

```swift
public static func ends(with sequence: T.Element...) -> Validator
```

Checks if the validated collection ends with the given sequence.

- Parameter sequence: A sequence which should be at the end of the validated collection.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sequence | A sequence which should be at the end of the validated collection. |

### `ends(with:caseInsensitive:)`

```swift
public static func ends(with substring: Substring, caseInsensitive: Bool = false) -> Validator
```

Checks if the validated string ends with the given substring.

- Parameter substring: A substring which should be at the end of the validated string.

#### Parameters

| Name | Description |
| ---- | ----------- |
| substring | A substring which should be at the end of the validated string. |

### `ends(with:caseInsensitive:)`

```swift
public static func ends(with substring: String, caseInsensitive: Bool = false) -> Validator
```

Checks if the validated string ends with the given substring.

- Parameter substring: A substring which should be at the end of the validated string.

#### Parameters

| Name | Description |
| ---- | ----------- |
| substring | A substring which should be at the end of the validated string. |

### `in(_:caseInsensitive:)`

```swift
public static func `in`(_ array: String..., caseInsensitive: Bool) -> Validator
```

Checks if the validated string is contained in the given array.

- Parameters:
  - array: An array of permitted values.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | An array of permitted values. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |

### `in(_:caseInsensitive:)`

```swift
public static func `in`(_ array: [String], caseInsensitive: Bool) -> Validator
```

Checks if the validated string is contained in the given array.

- Parameters:
  - array: An array of permitted values.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | An array of permitted values. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |

### `in(_:)`

```swift
public static func `in`(_ array: T...) -> Validator<T>
```

Checks if the validated value is contained in the given array.

- Parameter array: An array of permitted values.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | An array of permitted values. |

### `in(_:)`

```swift
public static func `in`(_ array: [T]) -> Validator<T>
```

Checks if the validated value is contained in the given array.

- Parameter array: An array of permitted values.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | An array of permitted values. |

### `in(_:)`

```swift
public static func `in`(_ set: Set<T>) -> Validator<T>
```

Checks if the validated value is contained in the given set.

- Parameter array: A set of permitted values.

#### Parameters

| Name | Description |
| ---- | ----------- |
| array | A set of permitted values. |

### `||(_:_:)`

```swift
public static func || (lhs: Validator<T?>, rhs: Validator<T>) -> Validator<T?>
```

Connects two validators with OR and ignores nil value for one of the validators.

Useful for checking optional fields:
```
let validator: Validator<String?> = .nil || .empty
```
Checks if the validated value is nil or empty.

### `||(_:_:)`

```swift
public static func || (lhs: Validator<T>, rhs: Validator<T?>) -> Validator<T?>
```

Connects two validators with OR and ignores nil value for one of the validators.

Useful for checking optional fields:
```
let validator: Validator<String?> = .empty || .nil
```
Checks if the validated value is nil or empty.

### `&&(_:_:)`

```swift
public static func && (lhs: Validator<T?>, rhs: Validator<T>) -> Validator<T?>
```

Connects two validators with AND and ignores nil value for one of the validators.

Useful for checking optional fields:
```
let validator: Validator<String?> = !.nil && !.empty
```
Checks if the validated value is not nil and not empty.

### `&&(_:_:)`

```swift
public static func && (lhs: Validator<T>, rhs: Validator<T?>) -> Validator<T?>
```

Connects two validators with AND and ignores nil value for one of the validators.

Useful for checking optional fields:
```
let validator: Validator<String?> = !.empty && !.nil
```
Checks if the validated value is not nil and not empty.

### `||(_:_:)`

```swift
public static func || (lhs: Validator, rhs: Validator) -> Validator
```

Connects two validators with OR.

Example:
```
let validator: Validator<String> = .email || .url
```
Checks if the validated value is a valid email address or a URL.

### `inRange(_:)`

```swift
public static func inRange(_ range: ClosedRange<T>) -> Validator<T>
```

Checks if the validated value is in the given range

- Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: Range<T>) -> Validator<T>
```

Checks if the validated value is in the given range

- Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: PartialRangeThrough<T>) -> Validator<T>
```

Checks if the validated value is in the given range

- Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: PartialRangeUpTo<T>) -> Validator<T>
```

Checks if the validated value is in the given range

- Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `inRange(_:)`

```swift
public static func inRange(_ range: PartialRangeFrom<T>) -> Validator<T>
```

Checks if the validated value is in the given range

- Parameter range: A range in which the value must be contained.

#### Parameters

| Name | Description |
| ---- | ----------- |
| range | A range in which the value must be contained. |

### `regexp(_:caseInsensitive:)`

```swift
public static func regexp(_ regexp: String, caseInsensitive: Bool = false) -> Validator<T>
```

Checks if at least part of the string fits the given regular expression.

If you want to check if whole string fits the regexp, start it with `^` and end with `$`.

- Parameters:
  - regexp: A regular expression for validation.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| regexp | A regular expression for validation. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |

### `starts(with:)`

```swift
public static func starts(with sequence: T.Element...) -> Validator
```

Checks if the validated collection starts with the given sequence.

- Parameter sequence: A sequence that has to be at the beginning of the validated collection.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sequence | A sequence that has to be at the beginning of the validated collection. |

### `starts(with:)`

```swift
public static func starts(with sequence: [T.Element]) -> Validator
```

Checks if the validated collection starts with the given sequence.

- Parameter sequence: A sequence that has to be at the beginning of the validated collection.

#### Parameters

| Name | Description |
| ---- | ----------- |
| sequence | A sequence that has to be at the beginning of the validated collection. |

### `starts(with:caseInsensitive:)`

```swift
public static func starts(with substring: Substring, caseInsensitive: Bool = false) -> Validator
```

Checks if the validated string starts with the given substring.

- Parameters:
  - substring: A substring that has to be at the beginning of the validated string.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| substring | A substring that has to be at the beginning of the validated string. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |

### `starts(with:caseInsensitive:)`

```swift
public static func starts(with substring: String, caseInsensitive: Bool = false) -> Validator
```

Checks if the validated string starts with the given substring.

- Parameters:
  - substring: A substring that has to be at the beginning of the validated string.
  - caseInsensitive: A boolean value if regexp matching should be case insensitive.

#### Parameters

| Name | Description |
| ---- | ----------- |
| substring | A substring that has to be at the beginning of the validated string. |
| caseInsensitive | A boolean value if regexp matching should be case insensitive. |