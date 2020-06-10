import Foundation

extension Validator where T: Collection {
    public static func count(_ range: Range<Int>) -> Validator<T> {
        CountValidator(min: range.lowerBound, max: range.upperBound, isUpperBoundClosed: false).validator()
    }
    
    public static func count(_ range: ClosedRange<Int>) -> Validator<T> {
        CountValidator(min: range.lowerBound, max: range.upperBound, isUpperBoundClosed: true).validator()
    }
    
    public static func count(_ range: PartialRangeUpTo<Int>) -> Validator<T> {
        CountValidator(min: nil, max: range.upperBound, isUpperBoundClosed: false).validator()
    }
    
    public static func count(_ range: PartialRangeThrough<Int>) -> Validator<T> {
        CountValidator(min: nil, max: range.upperBound, isUpperBoundClosed: true).validator()
    }
    
    public static func count(_ range: PartialRangeFrom<Int>) -> Validator<T> {
        CountValidator(min: range.lowerBound, max: nil, isUpperBoundClosed: true).validator()
    }
    
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
