import Foundation

public struct Validations<Model> where Model: Validatable {
    
    private var storage: [(PartialKeyPath<Model>, Validator<Model>)]
    
    // MARK: - Initialization
    public init(_ model: Model.Type = Model.self) {
        self.storage = []
    }
    
    // MARK: - Public
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
