import XCTest
import ModelValidator

final class ModelValidationTests: XCTestCase {}

// MARK: - validationErrors()
extension ModelValidationTests {
    func testValidationErrors_validModel() {
        // Arrange
        let sut = self.buildValidSUT()
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssert(errors.isEmpty)
    }
    
    func testValidationErrors_emptyFirstName() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.firstName = ""
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.firstNameIsEmpty])
    }
    
    func testValidationErrors_invalidLastName() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.lastName = "not Smith"
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.lastNameIncorrect])
    }
    
    func testValidationErrors_invalidEmail() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.email = "email@@me"
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.emailIncorrect])
    }
    
    func testValidationErrors_nilGender() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.gender = nil
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.genderIsEmpty])
    }
    
    func testValidationErrors_emptyGender() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.gender = ""
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.genderIsEmpty])
    }
    
    func testValidationErrors_hobbiesWithoutMusic() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.hobbies = ["ux", "programming"]
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.musicIsNotHobby])
    }
    
    func testValidationErrors_tooFewHobbies() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.hobbies = ["music"]
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.tooFewHobbies])
    }
    
    func testValidationErrors_tooManyHobbies() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.hobbies = ["music", "ux", "programming", "maths", "physics"]
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.tooManyHobbies])
    }
    
    func testValidationErrors_emptyFirstAndLastName() {
        // Arrange
        var sut = self.buildValidSUT()
        sut.firstName = ""
        sut.lastName = ""
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, [.firstNameIsEmpty, .lastNameIncorrect, .noName])
    }
    
    func testValidationErrors_multipleErrors() {
        // Arrange
        let sut = ModelMock(
            firstName: "",
            lastName: "",
            email: "incorrect@email",
            gender: nil,
            hobbies: [])
        let expectedErrors: [ModelMock.ValidationError] = [
            .firstNameIsEmpty,
            .lastNameIncorrect,
            .emailIncorrect,
            .genderIsEmpty,
            .musicIsNotHobby,
            .tooFewHobbies,
            .noName
        ]
        // Act
        let errors = sut.validationErrors()
        // Assert
        XCTAssertEqual(errors, expectedErrors)
    }
}

// MARK: - Private
extension ModelValidationTests {
    private func buildValidSUT() -> ModelMock {
        ModelMock(
            firstName: "John",
            lastName: "Smith",
            email: "smith@example.com",
            gender: "male",
            hobbies: ["music", "ux"])
    }
}
