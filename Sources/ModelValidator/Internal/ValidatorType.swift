import Foundation

protocol ValidatorType {
    associatedtype ValidatedData
    func validate(_ data: ValidatedData) throws
}

extension ValidatorType {
    func validator() -> Validator<ValidatedData> {
        Validator(validator: self.validate)
    }
}
