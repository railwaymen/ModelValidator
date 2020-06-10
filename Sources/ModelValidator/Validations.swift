import Foundation

public struct Validations<Model> where Model: Validatable {
    
    private var storage: [(PartialKeyPath<Model>, Validator<Model>)]
    
    // MARK: - Initialization
    
    /// Creates new Validations set for given model type.
    ///
    /// - Parameter model: A type of the validated model.
    public init(_ model: Model.Type = Model.self) {
        self.storage = []
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
        self.storage.append((
            keyPath,
            Validator<Model>(validator: { model in
                do {
                    try validator.validate(model[keyPath: keyPath])
                } catch _ {
                    throw error
                }
            })
        ))
    }
    
    /// Runs validations on given model.
    ///
    /// - Parameter model: A model to be validated.
    ///
    /// - Returns: An array of validation errors. If it's empty, model is valid.
    public func run(on model: Model) -> [Model.ValidationError] {
        self.storage.compactMap { _, validator in
            do {
                try validator.validate(model)
                return nil
            } catch {
                return error as? Model.ValidationError
            }
        }
    }
}
