import Foundation

extension Validator where T: Collection, T.Element: Equatable {
    /// Checks if the validated collection starts with the given sequence.
    ///
    /// - Parameter sequence: A sequence that has to be at the beginning of the validated collection.
    public static func starts(with sequence: T.Element...) -> Validator {
        self.starts(with: sequence)
    }
    
    /// Checks if the validated collection starts with the given sequence.
    ///
    /// - Parameter sequence: A sequence that has to be at the beginning of the validated collection.
    public static func starts(with sequence: [T.Element]) -> Validator {
        StartsWithValidator(sequence).validator()
    }
}

extension Validator where T == String {
    /// Checks if the validated string starts with the given substring.
    ///
    /// - Parameter substring: A substring that has to be at the beginning of the validated string.
    public static func starts(with substring: Substring) -> Validator {
        self.starts(with: substring.map { $0 })
    }
    
    /// Checks if the validated string starts with the given substring.
    ///
    /// - Parameter substring: A substring has have to be at the beginning of the validated string.
    public static func starts(with substring: String) -> Validator {
        self.starts(with: substring.map { $0 })
    }
}

private struct StartsWithValidator<T: Collection> where T.Element: Equatable {
    private let subsequence: [T.Element]
    
    // MARK: - Initialization
    init(_ subsequence: [T.Element]) {
        self.subsequence = subsequence
    }
}

// MARK: - ValidatorType
extension StartsWithValidator: ValidatorType {
    func validate(_ sequence: T) throws {
        guard sequence.starts(with: self.subsequence) else { throw BasicValidationError() }
    }
}
