import Foundation

extension Validator where T: Collection, T.Element: Equatable {
    /// Checks if the validated collection contains the given elements.
    ///
    /// - Parameter sequence: Elements which have to be in the validated collection in the given order.
    public static func contains(_ sequence: T.Element...) -> Validator {
        self.contains(sequence)
    }
    
    /// Checks if the validated collection contains the given elements.
    ///
    /// - Parameter sequence: Elements which have to be in the validated collection in the given order.
    public static func contains(_ sequence: [T.Element]) -> Validator {
        ContainsValidator(sequence).validator()
    }
}

extension Validator where T == String {
    /// Checks if the validated string contains the given substring.
    ///
    /// - Parameter substring: A substring which has to be in the validated string.
    public static func contains(_ substring: Substring) -> Validator {
        self.contains(substring.map { $0 })
    }
    
    /// Checks if the validated string contains the given substring.
    ///
    /// - Parameter substring: A substring which has to be in the validated string.
    public static func contains(_ substring: String) -> Validator {
        self.contains(substring.map { $0 })
    }
}

private struct ContainsValidator<T: Collection> where T.Element: Equatable {
    private let subsequence: [T.Element]
    
    // MARK: - Initialization
    init(_ subsequence: [T.Element]) {
        self.subsequence = subsequence
    }
}

// MARK: - ValidatorType
extension ContainsValidator: ValidatorType {
    func validate(_ sequence: T) throws {
        guard sequence.contains(self.subsequence) else { throw BasicValidationError() }
    }
}
