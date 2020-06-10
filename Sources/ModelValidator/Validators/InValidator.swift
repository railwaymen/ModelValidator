import Foundation

extension Validator where T: Equatable {
    
    /// Checks if the validated value is contained in the given array.
    ///
    /// - Parameter array: An array of permitted values.
    public static func `in`(_ array: T...) -> Validator<T> {
        InValidator(array: array).validator()
    }
    
    /// Checks if the validated value is contained in the given array.
    ///
    /// - Parameter array: An array of permitted values.
    public static func `in`(_ array: [T]) -> Validator<T> {
        InValidator(array: array).validator()
    }
}

extension Validator where T: Hashable {
    
    /// Checks if the validated value is contained in the given set.
    ///
    /// - Parameter array: A set of permitted values.
    public static func `in`(_ set: Set<T>) -> Validator<T> {
        InValidator(array: Array(set)).validator()
    }
}

private struct InValidator<T: Equatable> {
    private let array: [T]
    
    // MARK: - Initialization
    init(array: [T]) {
        self.array = array
    }
}

// MARK: - ValidatorType
extension InValidator: ValidatorType {
    func validate(_ data: T) throws {
        guard self.array.contains(data) else { throw BasicValidationError() }
    }
}
