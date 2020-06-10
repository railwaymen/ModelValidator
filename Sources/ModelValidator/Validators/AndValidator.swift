import Foundation

public func && <T>(lhs: Validator<T>, rhs: Validator<T>) -> Validator<T> {
    AndValidator(lhs, rhs).validator()
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
