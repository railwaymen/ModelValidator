import Foundation

public protocol Validatable {
    associatedtype ValidationError: Error
    
    /// Declares all validations for the validatable model.
    ///
    /// - Parameter validations: A structure which should be modified to add validations.
    func validations(validations: inout Validations<Self>)
}

extension Validatable {
    
    /// Validates the model.
    ///
    /// - Returns: An array of all validation errors.
    public func validationErrors() -> [ValidationError] {
        var validations = Validations<Self>()
        self.validations(validations: &validations)
        return validations.run(on: self)
    }
    
    /// Validates the model.
    ///
    /// - Throws: First occurred `ValidationError`.
    public func validate() throws {
        guard let error = self.validationErrors().first else { return }
        throw error
    }
}
