import Foundation

/// Connects two validators with OR and ignores nil value for one of the validators.
///
/// Useful for checking optional fields:
/// ```
/// let validator: Validator<String?> = .nil || .empty
/// ```
/// Checks if the validated value is nil or empty.
///
public func || <T>(lhs: Validator<T?>, rhs: Validator<T>) -> Validator<T?> {
    return lhs || NilIgnoringValidator(rhs).validator()
}

/// Connects two validators with OR and ignores nil value for one of the validators.
///
/// Useful for checking optional fields:
/// ```
/// let validator: Validator<String?> = .empty || .nil
/// ```
/// Checks if the validated value is nil or empty.
///
public func || <T>(lhs: Validator<T>, rhs: Validator<T?>) -> Validator<T?> {
    return NilIgnoringValidator(lhs).validator() || rhs
}

/// Connects two validators with AND and ignores nil value for one of the validators.
///
/// Useful for checking optional fields:
/// ```
/// let validator: Validator<String?> = !.nil && !.empty
/// ```
/// Checks if the validated value is not nil and not empty.
///
public func && <T>(lhs: Validator<T?>, rhs: Validator<T>) -> Validator<T?> {
    return lhs && NilIgnoringValidator(rhs).validator()
}

/// Connects two validators with AND and ignores nil value for one of the validators.
///
/// Useful for checking optional fields:
/// ```
/// let validator: Validator<String?> = !.empty && !.nil
/// ```
/// Checks if the validated value is not nil and not empty.
///
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
