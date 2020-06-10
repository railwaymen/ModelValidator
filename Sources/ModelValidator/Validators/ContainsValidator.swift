import Foundation

extension Validator where T: Collection, T.Element: Equatable {
    
    /// Checks if the validated collection contains the given element.
    ///
    /// - Parameter element: An element which have to be in the validated collection.
    public static func contains(_ element: T.Element) -> Validator<T> {
        ContainsValidator(element).validator()
    }
}

private struct ContainsValidator<T: Collection> where T.Element: Equatable {
    private let element: T.Element
    
    // MARK: - Initialization
    init(_ element: T.Element) {
        self.element = element
    }
}

// MARK: - ValidatorType
extension ContainsValidator: ValidatorType {
    func validate(_ data: T) throws {
        guard data.contains(self.element) else { throw BasicValidationError() }
    }
}
