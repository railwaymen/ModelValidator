import Foundation

extension Validator where T: OptionalType {
    public static var `nil`: Validator<T.WrappedType?> {
        NilValidator(T.WrappedType.self).validator()
    }
}

private struct NilValidator<T>: ValidatorType {
    typealias ValidatedData = T?
    
    // MARK: - Initialization
    init(_ type: T.Type) {}
}

// MARK: - ValidatorType
extension NilValidator {
    func validate(_ data: T?) throws {
        guard data == nil else { throw BasicValidationError() }
    }
}
