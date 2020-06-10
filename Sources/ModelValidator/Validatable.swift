import Foundation

public protocol Validatable {
    associatedtype ValidationError: Error
    func validations(validations: inout Validations<Self>)
}

extension Validatable {
    public func validationErrors() -> [ValidationError] {
        var validations = Validations<Self>()
        self.validations(validations: &validations)
        return validations.run(on: self)
    }
    
    public func validate() throws {
        guard let error = self.validationErrors().first else { return }
        throw error
    }
}
