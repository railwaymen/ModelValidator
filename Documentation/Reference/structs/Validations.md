**STRUCT**

# `Validations`

```swift
public struct Validations<Model> where Model: Validatable
```

## Methods
### `init(_:)`

```swift
public init(_ model: Model.Type = Model.self)
```

Creates a new Validations set for the given model type.

- Parameter model: A type of the validated model.

#### Parameters

| Name | Description |
| ---- | ----------- |
| model | A type of the validated model. |

### `add(_:_:error:)`

```swift
public mutating func add<T>(
    _ keyPath: KeyPath<Model, T>,
    _ validator: Validator<T>,
    error: Model.ValidationError
)
```

Adds a validation.

- Parameters:
  - keyPath: A field to be validated.
  - validator: A validator for the field.
  - error: An error which is returned if validator has failed.

#### Parameters

| Name | Description |
| ---- | ----------- |
| keyPath | A field to be validated. |
| validator | A validator for the field. |
| error | An error which is returned if validator has failed. |

### `add(_:validator:)`

```swift
public mutating func add<T>(
    _ keyPath: KeyPath<Model, T>,
    validator: @escaping (T) -> Model.ValidationError?
)
```

Adds a validation.

- Parameters:
  - keyPath: A field to be validated.
  - validator: A validator for the field.

#### Parameters

| Name | Description |
| ---- | ----------- |
| keyPath | A field to be validated. |
| validator | A validator for the field. |

### `add(validator:)`

```swift
public mutating func add(validator: @escaping (Model) -> Model.ValidationError?)
```

Adds a validation.

- Parameters:
  - validator: A validator for the model.

#### Parameters

| Name | Description |
| ---- | ----------- |
| validator | A validator for the model. |

### `run(on:)`

```swift
public func run(on model: Model) -> [Model.ValidationError]
```

Runs validations on given model.

- Parameter model: A model to be validated.

- Returns: An array of validation errors. If it's empty, model is valid.

#### Parameters

| Name | Description |
| ---- | ----------- |
| model | A model to be validated. |