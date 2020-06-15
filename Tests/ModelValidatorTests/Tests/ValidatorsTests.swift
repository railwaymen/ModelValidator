import XCTest
import ModelValidator

final class ValidatorsTests: XCTestCase {}

// MARK: - EmptyValidator
extension ValidatorsTests {
    func testEmptyValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.empty.validate(" "))
        XCTAssertThrowsError(try Validator<String>.empty.validate("some value"))
        XCTAssertThrowsError(try Validator<[String]>.empty.validate([""]))
        XCTAssertThrowsError(try Validator<[String]>.empty.validate(["some value"]))
        XCTAssertThrowsError(try Validator<Set<String>>.empty.validate([""]))
        XCTAssertThrowsError(try Validator<Set<String>>.empty.validate(["some values", "not", "only", "one"]))
    }
    
    func testEmptyValidator_success() {
        XCTAssertNoThrow(try Validator<String>.empty.validate(""))
        XCTAssertNoThrow(try Validator<[String]>.empty.validate([]))
        XCTAssertNoThrow(try Validator<Set<String>>.empty.validate([]))
    }
}

// MARK: - URLValidator
extension ValidatorsTests {
    func testURLValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.url.validate("dddd"))
        XCTAssertThrowsError(try Validator<String>.url.validate("/dir/file.txt"))
        XCTAssertThrowsError(try Validator<String>.url.validate("example.com"))
    }
    
    func testURLValidator_success() {
        XCTAssertNoThrow(try Validator<String>.url.validate("file:///dir/file.txt"))
        XCTAssertNoThrow(try Validator<String>.url.validate("http://example.com"))
        XCTAssertNoThrow(try Validator<String>.url.validate("https://example.com"))
        XCTAssertNoThrow(try Validator<String>.url.validate("http://example.com/some/sub/domain"))
    }
}

// MARK: - NotValidator
extension ValidatorsTests {
    func testNotValidator_throwsError() {
        //Arrange
        let sut: Validator<String> = !.empty
        //Assert
        XCTAssertThrowsError(try sut.validate(""))
    }
    
    func testNotValidator_success() {
        //Arrange
        let sut: Validator<String> = !.empty
        //Assert
        XCTAssertNoThrow(try sut.validate("not empty"))
    }
}

// MARK: - OrValidator
extension ValidatorsTests {
    func testOrValidator_throwsError() {
        //Arrange
        let sut: Validator<String> = .empty || .url
        //Assert
        XCTAssertThrowsError(try sut.validate("Not url or empty"))
    }
    
    func testOrValidator_success() {
        //Arrange
        let sut: Validator<String> = .empty || .url
        //Assert
        XCTAssertNoThrow(try sut.validate(""))
        XCTAssertNoThrow(try sut.validate("https://example.com"))
    }
}

// MARK: - AndValidator
extension ValidatorsTests {
    func testAndValidator_throwsError() {
        //Arrange
        let sut: Validator<String> = !.empty && !.url
        //Assert
        XCTAssertThrowsError(try sut.validate(""))
        XCTAssertThrowsError(try sut.validate("https://example.com"))
    }
    
    func testAndValidator_success() {
        //Arrange
        let sut: Validator<String> = !.empty && !.url
        //Assert
        XCTAssertNoThrow(try sut.validate("Not empty and not url"))
    }
}

// MARK: - NilValidator
extension ValidatorsTests {
    func testNilValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String?>.nil.validate(""))
        XCTAssertThrowsError(try Validator<[String]?>.nil.validate([]))
    }
    
    func testNilValidator_success() {
        XCTAssertNoThrow(try Validator<String?>.nil.validate(nil))
        XCTAssertNoThrow(try Validator<[String]?>.nil.validate(nil))
    }
}

// MARK: - NilIgnoringValidator
extension ValidatorsTests {
    func testNilIgnoringValidator_throwsError() {
        XCTAssertThrowsError(try (Validator<String?>.nil || Validator<String>.empty).validate("Not empty and not nil"))
        XCTAssertThrowsError(try (!Validator<String?>.nil && !Validator<String>.empty).validate(""))
        XCTAssertThrowsError(try (!Validator<String?>.nil && !Validator<String>.empty).validate(nil))
        
        XCTAssertThrowsError(try (Validator<String>.empty || Validator<String?>.nil).validate("Not empty and not nil"))
        XCTAssertThrowsError(try (!Validator<String>.empty && !Validator<String?>.nil).validate(""))
        XCTAssertThrowsError(try (!Validator<String>.empty && !Validator<String?>.nil).validate(nil))
    }
    
    func testNilIgnoringValidator_success() {
        XCTAssertNoThrow(try (Validator<String?>.nil || Validator<String>.empty).validate(""))
        XCTAssertNoThrow(try (Validator<String?>.nil || Validator<String>.empty).validate(nil))
        XCTAssertNoThrow(try (!Validator<String?>.nil && !Validator<String>.empty).validate("Not empty and not nil"))
        
        XCTAssertNoThrow(try (Validator<String>.empty || Validator<String?>.nil).validate(""))
        XCTAssertNoThrow(try (Validator<String>.empty || Validator<String?>.nil).validate(nil))
        XCTAssertNoThrow(try (!Validator<String>.empty && !Validator<String?>.nil).validate("Not empty and not nil"))
    }
}

// MARK: - RegexpValidator
extension ValidatorsTests {
    func testRegexpValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.regexp("[a-z]+").validate("NOT LOWERCASED"))
        XCTAssertThrowsError(try Validator<String>.regexp("^[a-z]+$").validate("withnumber0"))
        XCTAssertThrowsError(try Validator<String>.regexp("^[a-z]+$").validate("with space"))
        XCTAssertThrowsError(try Validator<String>.regexp("^[a-z]+$").validate("withaCapitalletter"))
    }
    
    func testRegexpValidator_success() {
        XCTAssertNoThrow(try Validator<String>.regexp("[a-z]+").validate("WITH ONE PASSING LETTER: a"))
        XCTAssertNoThrow(try Validator<String>.regexp("^[a-z]+$").validate("withonlylowercasedletters"))
        XCTAssertNoThrow(try Validator<String>.regexp("^[a-z ]+$").validate("with space"))
        XCTAssertNoThrow(try Validator<String>.regexp("^[a-z]+$", caseInsensitive: true).validate("caseINsensitive"))
    }
}

// MARK: - InValidator
extension ValidatorsTests {
    func testInValidator_throwsError() {
        //Arrange
        let sut: Validator<String> = .in("this", "that")
        //Assert
        XCTAssertThrowsError(try sut.validate(""))
        XCTAssertThrowsError(try sut.validate(" "))
        XCTAssertThrowsError(try sut.validate("not this"))
        XCTAssertThrowsError(try sut.validate("and not that"))
        XCTAssertThrowsError(try Validator<String>.in(["this", "that"]).validate("in the array"))
        XCTAssertThrowsError(try Validator<String>.in(Set(["this", "that"])).validate("in the set"))
    }
    
    func testInValidator_success() {
        //Arrange
        let sut: Validator<String> = .in("this", "that")
        //Assert
        XCTAssertNoThrow(try sut.validate("this"))
        XCTAssertNoThrow(try sut.validate("that"))
        XCTAssertNoThrow(try Validator<String>.in(["this", "that"]).validate("this"))
        XCTAssertNoThrow(try Validator<String>.in(Set(["this", "that"])).validate("this"))
    }
}

// MARK: - CountValidator
extension ValidatorsTests {
    func testCountValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.count(1...2).validate(""))
        XCTAssertThrowsError(try Validator<String>.count(1...2).validate("123"))
        XCTAssertThrowsError(try Validator<String>.count(1..<2).validate(""))
        XCTAssertThrowsError(try Validator<String>.count(1..<2).validate("12"))
        XCTAssertThrowsError(try Validator<String>.count(1...).validate(""))
        XCTAssertThrowsError(try Validator<String>.count(...2).validate("123"))
        XCTAssertThrowsError(try Validator<String>.count(..<3).validate("123"))
        XCTAssertThrowsError(try Validator<String>.count(2).validate("1"))
        XCTAssertThrowsError(try Validator<String>.count(2).validate("123"))
    }
    
    func testCountValidator_success() {
        XCTAssertNoThrow(try Validator<String>.count(1...2).validate("1"))
        XCTAssertNoThrow(try Validator<String>.count(1...2).validate("12"))
        XCTAssertNoThrow(try Validator<String>.count(1..<2).validate("1"))
        XCTAssertNoThrow(try Validator<String>.count(1...).validate("123"))
        XCTAssertNoThrow(try Validator<String>.count(...2).validate("12"))
        XCTAssertNoThrow(try Validator<String>.count(..<3).validate("12"))
        XCTAssertNoThrow(try Validator<String>.count(2).validate("12"))
    }
}

// MARK: - ContainsValidator
extension ValidatorsTests {
    func testContainsValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.contains("y").validate("without the element"))
        XCTAssertThrowsError(try Validator<[String]>.contains("y").validate(["a", "b", "Y", "n"]))
        
        XCTAssertThrowsError(try Validator<String>.contains("a", "o", "g").validate("Anna has a dog."))
        XCTAssertThrowsError(try Validator<String>.contains(["a", "o", "g"]).validate("Anna has a dog."))
        XCTAssertThrowsError(try Validator<String>.contains(["g", "o", "d"]).validate("Anna has a dog."))
        XCTAssertThrowsError(try Validator<String>.contains("god").validate("Anna has a dog."))
        XCTAssertThrowsError(try Validator<String>.contains("dogo").validate("Anna has a dog."))
        XCTAssertThrowsError(try Validator<String>.contains(Substring("god")).validate("Anna has a dog."))
    }
    
    func testContainsValidator_success() {
        XCTAssertNoThrow(try Validator<String>.contains("y").validate("with the y element"))
        XCTAssertNoThrow(try Validator<[String]>.contains("y").validate(["a", "b", "y", "n"]))
        
        XCTAssertNoThrow(try Validator<String>.contains("d", "o", "g").validate("Anna has a dog."))
        XCTAssertNoThrow(try Validator<String>.contains(["d", "o", "g"]).validate("Anna has a dog."))
        XCTAssertNoThrow(try Validator<String>.contains("dog").validate("Anna has a dog."))
        XCTAssertNoThrow(try Validator<String>.contains(" a ").validate("Anna has a dog."))
        XCTAssertNoThrow(try Validator<String>.contains(Substring("dog")).validate("Anna has a dog."))
    }
}

// MARK: - RangeValidator
extension ValidatorsTests {
    func testRangeValidator_throwsError() {
        XCTAssertThrowsError(try Validator<Int>.inRange(1...3).validate(0))
        XCTAssertThrowsError(try Validator<Int>.inRange(1...3).validate(4))
        XCTAssertThrowsError(try Validator<Int>.inRange(1..<4).validate(0))
        XCTAssertThrowsError(try Validator<Int>.inRange(1..<4).validate(4))
        XCTAssertThrowsError(try Validator<Int>.inRange(...3).validate(4))
        XCTAssertThrowsError(try Validator<Int>.inRange(..<4).validate(4))
        XCTAssertThrowsError(try Validator<Int>.inRange(..<4).validate(5))
        XCTAssertThrowsError(try Validator<Int>.inRange(1...).validate(0))
    }
    
    func testRangeValidator_success() {
        XCTAssertNoThrow(try Validator<Int>.inRange(1...3).validate(1))
        XCTAssertNoThrow(try Validator<Int>.inRange(1...3).validate(2))
        XCTAssertNoThrow(try Validator<Int>.inRange(1...3).validate(3))
        XCTAssertNoThrow(try Validator<Int>.inRange(1..<4).validate(1))
        XCTAssertNoThrow(try Validator<Int>.inRange(1..<4).validate(2))
        XCTAssertNoThrow(try Validator<Int>.inRange(1..<4).validate(3))
        XCTAssertNoThrow(try Validator<Int>.inRange(...3).validate(3))
        XCTAssertNoThrow(try Validator<Int>.inRange(...3).validate(-12))
        XCTAssertNoThrow(try Validator<Int>.inRange(..<4).validate(3))
        XCTAssertNoThrow(try Validator<Int>.inRange(..<4).validate(2))
        XCTAssertNoThrow(try Validator<Int>.inRange(1...).validate(1))
        XCTAssertNoThrow(try Validator<Int>.inRange(1...).validate(8))
    }
}

// MARK: - EmailValidator
extension ValidatorsTests {
    func testEmailValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.email.validate("not an email"))
        XCTAssertThrowsError(try Validator<String>.email.validate("stillNotAnEmail"))
        XCTAssertThrowsError(try Validator<String>.email.validate("evenlowercased"))
        XCTAssertThrowsError(try Validator<String>.email.validate("432423"))
        XCTAssertThrowsError(try Validator<String>.email.validate("@example.com"))
        XCTAssertThrowsError(try Validator<String>.email.validate("smith@example"))
        XCTAssertThrowsError(try Validator<String>.email.validate("smith@example.s"))
    }
    
    func testEmailValidator_success() {
        XCTAssertNoThrow(try Validator<String>.email.validate("but.this.could+be@example.com"))
        XCTAssertNoThrow(try Validator<String>.email.validate("simple@example.eu"))
        XCTAssertNoThrow(try Validator<String>.email.validate("simple@example.com"))
        XCTAssertNoThrow(try Validator<String>.email.validate("simple+extension@example.com"))
        XCTAssertNoThrow(try Validator<String>.email.validate("JOHN.smith+extension@example.com"))
        XCTAssertNoThrow(try Validator<String>.email.validate("simple192email+extension@example.com"))
        XCTAssertNoThrow(try Validator<String>.email.validate("simple+extension443@example.com"))
    }
}

// MARK: - EndsWithValidator
extension ValidatorsTests {
    func testEndsWithValidator_throwsError() {
        XCTAssertThrowsError(try Validator<String>.ends(with: ["a", "b", "c"]).validate("abcd"))
        XCTAssertThrowsError(try Validator<String>.ends(with: ["a", "b", "c"]).validate("c"))
        XCTAssertThrowsError(try Validator<String>.ends(with: "a", "b", "c").validate("abcd"))
        XCTAssertThrowsError(try Validator<String>.ends(with: "abc").validate("abcd"))
        XCTAssertThrowsError(try Validator<String>.ends(with: Substring("abc")).validate("abcd"))
    }
    
    func testEndsWithValidator_success() {
        XCTAssertNoThrow(try Validator<String>.ends(with: ["a", "b", "c"]).validate("dabc"))
        XCTAssertNoThrow(try Validator<String>.ends(with: ["a", "b", "c"]).validate("abc"))
        XCTAssertNoThrow(try Validator<String>.ends(with: "a", "b", "c").validate("dabc"))
        XCTAssertNoThrow(try Validator<String>.ends(with: "abc").validate("dabc"))
        XCTAssertNoThrow(try Validator<String>.ends(with: Substring("abc")).validate("dabc"))
    }
}
