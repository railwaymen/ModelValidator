import Foundation

extension Validator {
    /// Connects two validators with AND.
    ///
    /// Example:
    /// ```
    /// let validator: Validator<String> = .email && .count(...64)
    /// ```
    /// Checks if the validated value is a valid email and the string has no more than 64 characters.
    ///
    public static func &&(lhs: Validator, rhs: Validator) -> Validator {
        AndValidator(lhs, rhs).validator()
    }
}

private struct AndValidator<T> {
    private let lhs: Validator<T>
    private let rhs: Validator<T>
    
    // MARK: - Initialization
    init(_ lhs: Validator<T>, _ rhs: Validator<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
}

// MARK: - ValidatorType
extension AndValidator: ValidatorType {
    func validate(_ data: T) throws {
        try self.lhs.validate(data)
        try self.rhs.validate(data)
    }
}
