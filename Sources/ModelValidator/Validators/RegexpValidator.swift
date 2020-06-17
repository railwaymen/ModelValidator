import Foundation

extension Validator where T == String {
    
    /// Checks if at least part of the string fits the given regular expression.
    ///
    /// If you want to check if whole string fits the regexp, start it with `^` and end with `$`.
    ///
    /// - Parameters:
    ///   - regexp: A regular expression for validation.
    ///   - caseInsensitive: A boolean value if regexp matching should be case insensitive.
    public static func regexp(_ regexp: String, caseInsensitive: Bool = false) -> Validator<T> {
        RegexpValidator(regexp, caseInsensitive: caseInsensitive).validator()
    }
}

private struct RegexpValidator {
    private let regexp: String
    private let caseInsensitive: Bool
    
    // MARK: - Initialization
    init(_ regexp: String, caseInsensitive: Bool) {
        self.regexp = regexp
        self.caseInsensitive = caseInsensitive
    }
}

// MARK: - ValidatorType
extension RegexpValidator: ValidatorType {
    func validate(_ data: String) throws {
        var options: NSString.CompareOptions = [.regularExpression]
        if self.caseInsensitive {
            options.insert(.caseInsensitive)
        }
        guard data.range(of: self.regexp, options: options) != nil else { throw BasicValidationError() }
    }
}
