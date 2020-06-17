import Foundation

public struct Validations<Model> where Model: Validatable {
    
    private var validators: [Validator<Model>]
    
    // MARK: - Initialization
    
    /// Creates a new Validations set for the given model type.
    ///
    /// - Parameter model: A type of the validated model.
    public init(_ model: Model.Type = Model.self) {
        self.validators = []
    }
    
    // MARK: - Public
    
    /// Adds a validation.
    ///
    /// - Parameters:
    ///   - keyPath: A field to be validated.
    ///   - validator: A validator for the field.
    ///   - error: An error which is returned if validator has failed.
    public mutating func add<T>(
        _ keyPath: KeyPath<Model, T>,
        _ validator: Validator<T>,
        error: Model.ValidationError
    ) {
        self.add(keyPath) { field -> Model.ValidationError? in
            do {
                try validator.validate(field)
                return nil
            } catch _ {
                return error
            }
        }
    }
    
    /// Adds a validation.
    ///
    /// - Parameters:
    ///   - keyPath: A field to be validated.
    ///   - validator: A validator for the field.
    public mutating func add<T>(
        _ keyPath: KeyPath<Model, T>,
        validator: @escaping (T) -> Model.ValidationError?
    ) {
        self.add { model -> Model.ValidationError? in
            guard let error = validator(model[keyPath: keyPath]) else { return nil }
            return error
        }
    }
    
    /// Adds a validation.
    ///
    /// - Parameters:
    ///   - validator: A validator for the model.
    public mutating func add(validator: @escaping (Model) -> Model.ValidationError?) {
        self.validators.append(
            Validator<Model>(validator: { model in
                guard let error = validator(model) else { return }
                throw error
            })
        )
    }
    
    /// Runs validations on given model.
    ///
    /// - Parameter model: A model to be validated.
    ///
    /// - Returns: An array of validation errors. If it's empty, model is valid.
    public func run(on model: Model) -> [Model.ValidationError] {
        self.validators.compactMap { validator in
            do {
                try validator.validate(model)
                return nil
            } catch let error as Model.ValidationError {
                return error
            } catch {
                assertionFailure("Unknown error catched: \(error)")
                return nil
            }
        }
    }
}
