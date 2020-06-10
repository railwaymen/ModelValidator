import Foundation

extension Validator where T: Equatable {
    public static func `in`(_ array: T...) -> Validator<T> {
        InValidator(array: array).validator()
    }
    
    public static func `in`(_ array: [T]) -> Validator<T> {
        InValidator(array: array).validator()
    }
}

extension Validator where T: Hashable {
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
