import Foundation

extension Validator where T: Collection {
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
