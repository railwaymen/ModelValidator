import Foundation

extension Validator where T: Collection {
    
    /// Checks if the count of the validated collection is in the given range.
    ///
    /// - Parameter range: A range in which the collection's count must be.
    public static func count(_ range: Range<Int>) -> Validator<T> {
        CountValidator(min: range.lowerBound, max: range.upperBound, isUpperBoundClosed: false).validator()
    }
    
    /// Checks if the count of the validated collection is in the given range.
    ///
    /// - Parameter range: A range in which the collection's count must be.
    public static func count(_ range: ClosedRange<Int>) -> Validator<T> {
        CountValidator(min: range.lowerBound, max: range.upperBound, isUpperBoundClosed: true).validator()
    }
    
    /// Checks if the count of the validated collection is in the given range.
    ///
    /// - Parameter range: A range in which the collection's count must be.
    public static func count(_ range: PartialRangeUpTo<Int>) -> Validator<T> {
        CountValidator(min: nil, max: range.upperBound, isUpperBoundClosed: false).validator()
    }
    
    /// Checks if the count of the validated collection is in the given range.
    ///
    /// - Parameter range: A range in which the collection's count must be.
    public static func count(_ range: PartialRangeThrough<Int>) -> Validator<T> {
        CountValidator(min: nil, max: range.upperBound, isUpperBoundClosed: true).validator()
    }
    
    /// Checks if the count of the validated collection is in the given range.
    ///
    /// - Parameter range: A range in which the collection's count must be.
    public static func count(_ range: PartialRangeFrom<Int>) -> Validator<T> {
        CountValidator(min: range.lowerBound, max: nil, isUpperBoundClosed: true).validator()
    }
    
    /// Checks if the count of the validated collection if equal to the given value.
    ///
    /// - Parameter count: A required collections' count.
    public static func count(_ count: Int) -> Validator<T> {
        CountValidator(min: count, max: count, isUpperBoundClosed: true).validator()
    }
}

private struct CountValidator<T: Collection> {
    private let min: Int?
    private let max: Int?
    private let isUpperBoundClosed: Bool
    
    // MARK: - Initialization
    init(min: Int?, max: Int?, isUpperBoundClosed: Bool) {
        self.min = min
        self.max = max
        self.isUpperBoundClosed = isUpperBoundClosed
    }
}

// MARK: - ValidatorType
extension CountValidator: ValidatorType {
    func validate(_ collection: T) throws {
        let min = self.min ?? 0
        let max = self.max ?? collection.count
        let fitsInUpperBound: Bool = self.isUpperBoundClosed
            ? (collection.count <= max)
            : (collection.count < max)
        guard collection.count >= min && fitsInUpperBound else { throw BasicValidationError() }
    }
}
