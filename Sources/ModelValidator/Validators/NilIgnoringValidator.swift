import Foundation

public func || <T>(lhs: Validator<T?>, rhs: Validator<T>) -> Validator<T?> {
    return lhs || NilIgnoringValidator(rhs).validator()
}

public func || <T>(lhs: Validator<T>, rhs: Validator<T?>) -> Validator<T?> {
    return NilIgnoringValidator(lhs).validator() || rhs
}

public func && <T>(lhs: Validator<T?>, rhs: Validator<T>) -> Validator<T?> {
    return lhs && NilIgnoringValidator(rhs).validator()
}

public func && <T>(lhs: Validator<T>, rhs: Validator<T?>) -> Validator<T?> {
    return NilIgnoringValidator(lhs).validator() && rhs
}

private struct NilIgnoringValidator<T> {
    
    private let validator: Validator<T>
    
    // MARK: - Initialization
    init(_ validator: Validator<T>) {
        self.validator = validator
    }
}

// MARK: - ValidatorType
extension NilIgnoringValidator: ValidatorType {
    func validate(_ data: T?) throws {
        guard let data = data else { return }
        try self.validator.validate(data)
    }
}
