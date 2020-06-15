# ModelValidator

Framework for model validations for Swift with custom errors returned on validation.

## Usage

The framework is created to be used when you want to receive custom errors on each validation. This because we don't want to always display the error as a string but sometimes we would like to highlight not valid fields and give detailed custom information about what's wrong with the provided data. Moreover, if we think about highlighting the fields in the form, we have to get all the validation errors at once for the better UX. This framework is designed for these use cases.

### Installation

The preferred installation type is by using [Swift Package Manager](https://swift.org/package-manager/).

### Example usage

Below you can see the simplest validation for a model. If you're looking for a list of all available validators, enter the Documentation folder.

```swift
import ModelValidator

struct LoginForm: Validatable {
  var email: String?
  var password: String

  func validations(validations: inout Validations<LoginForm>) {
    validations.add(\.email, !.nil && .email, error: .emailIsInvalid)
    validations.add(\.password, .count(8...), error: .passwordIsTooShort)
  }

  enum ValidationError: Error {
    case emailIsInvalid, passwordIsTooShort
  }
}

```

More examples you can find in [tests](Tests/ModelValidatorTests/Tests)

## Contibution

If you have some idea for a new feature, create an issue or add a pull request.

We don't use Linux for Swift, so if you have a proposition to run it on Linux, please create a pull request with the needed changes.

The framework has no dependencies. Only things you should have is Swift compiler and [SwiftLint](https://github.com/realm/SwiftLint) on your machine.
