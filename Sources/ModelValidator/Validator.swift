import Foundation

/// A validator for the given data type.
public struct Validator<T> {
    let validator: (T) throws -> Void
    
    /// Validates the given data against validator.
    ///
    /// - Parameter data: A data to be validated.
    ///
    /// - Throws: Error thrown by the `validator`. For default validators it is always `BasicValidationError`.
    public func validate(_ data: T) throws {
        try self.validator(data)
    }
}
