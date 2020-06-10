import Foundation

public prefix func ! <T>(_ validator: Validator<T>) -> Validator<T> {
    NotValidator(validator).validator()
}

private struct NotValidator<T> {
    private let validator: Validator<T>
    
    // MARK: - Initialization
    init(_ validator: Validator<T>) {
        self.validator = validator
    }
}

// MARK: - ValidatorType
extension NotValidator: ValidatorType {
    func validate(_ data: T) throws {
        do {
            try self.validator.validate(data)
        } catch _ as BasicValidationError { return }
        throw BasicValidationError()
    }
}
