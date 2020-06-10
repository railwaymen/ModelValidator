import Foundation

/// Connects two validators with OR.
///
/// Example:
/// ```
/// let validator: Validator<String> = .email || .url
/// ```
/// Checks if the validated value is a valid email address or a URL.
///
public func || <T>(lhs: Validator<T>, rhs: Validator<T>) -> Validator<T> {
    OrValidator(lhs, rhs).validator()
}

private struct OrValidator<T> {
    private let lhs: Validator<T>
    private let rhs: Validator<T>
    
    // MARK: - Initialization
    init(_ lhs: Validator<T>, _ rhs: Validator<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
}

// MARK: - ValidatorType
extension OrValidator: ValidatorType {
    func validate(_ data: T) throws {
        do {
            try self.lhs.validate(data)
        } catch {
            do {
                try self.rhs.validate(data)
            } catch {
                throw BasicValidationError()
            }
        }
    }
}
