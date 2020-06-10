import Foundation

extension Validator where T: Collection {
    
    /// Checks if the validated collection is empty.
    public static var empty: Validator<T> {
        EmptyValidator().validator()
    }
}

private struct EmptyValidator<ValidatedData: Collection> {}

// MARK: - ValidatorType
extension EmptyValidator: ValidatorType {
    func validate(_ collection: ValidatedData) throws {
        guard collection.isEmpty else { throw BasicValidationError() }
    }
}
