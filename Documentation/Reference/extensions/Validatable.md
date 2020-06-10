**EXTENSION**

# `Validatable`
```swift
extension Validatable
```

## Methods
### `validationErrors()`

```swift
public func validationErrors() -> [ValidationError]
```

> Validates the model.
>
> - Returns: An array of all validation errors.

### `validate()`

```swift
public func validate() throws
```

> Validates the model.
>
> - Throws: First occurred `ValidationError`.
