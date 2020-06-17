import Foundation

extension Validator where T == String {
    
    /// Checks if the string represents a valid URL.
    ///
    /// A valid URL should be a path to a file:
    /// ```
    /// "file:///path/to/file"
    /// ```
    /// Or have a scheme and a host:
    /// ```
    /// "scheme://host"
    /// "https://example.com"
    /// ```
    /// Any other with fail e.g.:
    /// ```
    /// "example.com" // Will fail because has no sheme
    /// ```
    ///
    public static var url: Validator<T> {
        URLValidator().validator()
    }
}

private struct URLValidator {}

// MARK: - ValidatorType
extension URLValidator: ValidatorType {
    func validate(_ data: String) throws {
        guard let url = URL(string: data),
            url.isFileURL || (url.host != nil && url.scheme != nil) else {
                throw BasicValidationError()
        }
    }
}
