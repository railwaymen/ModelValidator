import Foundation

extension Validator where T == String {
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
