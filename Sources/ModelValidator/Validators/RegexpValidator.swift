import Foundation

extension Validator where T == String {
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
