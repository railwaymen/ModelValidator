import Foundation

extension Validator where T == String {
    
    /// Checks if validated value is a valid email address.
    public static var email: Validator<T> {
        let regexp = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        return .regexp(regexp, caseInsensitive: true)
    }
}
