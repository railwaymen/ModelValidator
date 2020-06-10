**STRUCT**

# `Validator`

```swift
public struct Validator<T>
```

A validator for the given data type.

## Methods
### `validate(_:)`

```swift
public func validate(_ data: T) throws
```

Validates the given data against validator.

- Parameter data: A data to be validated.

- Throws: Error thrown by the `validator`. For default validators it is always `BasicValidationError`.

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | A data to be validated. |