import Foundation
import ModelValidator

struct ModelMock: Validatable {
    var firstName: String
    var lastName: String
    var email: String
    var gender: String?
    var hobbies: [String]
    
    func validations(validations: inout Validations<ModelMock>) {
        validations.add(\.firstName, !.empty, error: .firstNameIsEmpty)
        validations.add(\.lastName, .starts(with: "Sm"), error: .lastNameIncorrect)
        validations.add(\.email, .email, error: .emailIncorrect)
        validations.add(\.gender, !.nil && !.empty, error: .genderIsEmpty)
        validations.add(\.hobbies, .contains("music"), error: .musicIsNotHobby)
        validations.add(\.hobbies, .count(2...), error: .tooFewHobbies)
        validations.add(\.hobbies, .count(...4), error: .tooManyHobbies)
        
        validations.add { model -> ValidationError? in
            guard model.firstName.isEmpty && model.lastName.isEmpty else { return nil }
            return .noName
        }
    }
    
    enum ValidationError: Error {
        case noName
        case firstNameIsEmpty
        case lastNameIncorrect
        case emailIncorrect
        case genderIsEmpty
        case musicIsNotHobby
        case tooFewHobbies
        case tooManyHobbies
    }
}
