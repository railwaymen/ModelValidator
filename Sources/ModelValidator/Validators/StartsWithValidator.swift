import Foundation

extension Validator where T: Collection, T.Element: Equatable {
    
    public static func starts(with sequence: T.Element...) -> Validator {
        self.starts(with: sequence)
    }
    
    public static func starts(with sequence: [T.Element]) -> Validator {
        StartsWithValidator(sequence).validator()
    }
}

extension Validator where T == String {
    public static func starts(with substring: Substring) -> Validator {
        self.starts(with: substring.map { $0 })
    }
    
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
