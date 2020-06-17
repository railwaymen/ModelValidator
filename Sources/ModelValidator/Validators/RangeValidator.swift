import Foundation

extension Validator where T: Comparable {
    
    /// Checks if the validated value is in the given range
    ///
    /// - Parameter range: A range in which the value must be contained.
    public static func inRange(_ range: ClosedRange<T>) -> Validator<T> {
        RangeValidator(min: range.lowerBound, max: range.upperBound, isUpperBoundClosed: true).validator()
    }
    
    /// Checks if the validated value is in the given range
    ///
    /// - Parameter range: A range in which the value must be contained.
    public static func inRange(_ range: Range<T>) -> Validator<T> {
        RangeValidator(min: range.lowerBound, max: range.upperBound, isUpperBoundClosed: false).validator()
    }
    
    /// Checks if the validated value is in the given range
    ///
    /// - Parameter range: A range in which the value must be contained.
    public static func inRange(_ range: PartialRangeThrough<T>) -> Validator<T> {
        RangeValidator(min: nil, max: range.upperBound, isUpperBoundClosed: true).validator()
    }
    
    /// Checks if the validated value is in the given range
    ///
    /// - Parameter range: A range in which the value must be contained.
    public static func inRange(_ range: PartialRangeUpTo<T>) -> Validator<T> {
        RangeValidator(min: nil, max: range.upperBound, isUpperBoundClosed: false).validator()
    }
    
    /// Checks if the validated value is in the given range
    ///
    /// - Parameter range: A range in which the value must be contained.
    public static func inRange(_ range: PartialRangeFrom<T>) -> Validator<T> {
        RangeValidator(min: range.lowerBound, max: nil, isUpperBoundClosed: false).validator()
    }
}

private struct RangeValidator<T: Comparable> {
    private let min: T?
    private let max: T?
    private let isUpperBoundClosed: Bool
    
    // MARK: - Initialization
    init(min: T?, max: T?, isUpperBoundClosed: Bool) {
        self.min = min
        self.max = max
        self.isUpperBoundClosed = isUpperBoundClosed
    }
}

// MARK: - ValidatorType
extension RangeValidator: ValidatorType {
    func validate(_ data: T) throws {
        if let min = self.min {
            guard data >= min else { throw BasicValidationError() }
        }
        if let max = self.max {
            let fitsInUpperBound: Bool = self.isUpperBoundClosed
                ? (data <= max)
                : (data < max)
            guard fitsInUpperBound else { throw BasicValidationError() }
        }
    }
}
