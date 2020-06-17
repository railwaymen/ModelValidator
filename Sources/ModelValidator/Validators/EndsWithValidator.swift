import Foundation

extension Validator where T: Collection, T.Element: Equatable {
    /// Checks if the validated collection ends with the given sequence.
    ///
    /// - Parameter sequence: A sequence which should be at the end of the validated collection.
    public static func ends(with sequence: [T.Element]) -> Validator {
        EndsWithValidator(sequence).validator()
    }
    
    /// Checks if the validated collection ends with the given sequence.
    ///
    /// - Parameter sequence: A sequence which should be at the end of the validated collection.
    public static func ends(with sequence: T.Element...) -> Validator {
        self.ends(with: sequence)
    }
}

extension Validator where T == String {
    /// Checks if the validated string ends with the given substring.
    ///
    /// - Parameter substring: A substring which should be at the end of the validated string.
    public static func ends(with substring: Substring, caseInsensitive: Bool = false) -> Validator {
        self.regexp("\(substring)$", caseInsensitive: caseInsensitive)
    }
    
    /// Checks if the validated string ends with the given substring.
    ///
    /// - Parameter substring: A substring which should be at the end of the validated string.
    public static func ends(with substring: String, caseInsensitive: Bool = false) -> Validator {
        self.regexp("\(substring)$", caseInsensitive: caseInsensitive)
    }
}

private struct EndsWithValidator<T: Collection> where T.Element: Equatable {
    private let subsequence: [T.Element]
    
    // MARK: - Initialization
    init(_ subsequence: [T.Element]) {
        self.subsequence = subsequence
    }
}

// MARK: - ValidatorType
extension EndsWithValidator: ValidatorType {
    func validate(_ sequence: T) throws {
        guard sequence.ends(with: self.subsequence) else { throw BasicValidationError() }
    }
}
