import Foundation

public struct Validator<T> {
    let validator: (T) throws -> Void
    
    public func validate(_ data: T) throws {
        try self.validator(data)
    }
}
