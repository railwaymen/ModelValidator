import Foundation

extension Collection where Element: Equatable {
    func ends(with collection: [Element]) -> Bool {
        let indexOffset = self.count - collection.count
        guard indexOffset >= 0 else { return false }
        let endingCollection = self.dropFirst(indexOffset)
        guard !endingCollection.isEmpty else { return false }
        return endingCollection.elementsEqual(collection)
    }

    /// Checks if the collection contains other collection in its order.
    ///
    /// Code from: https://forums.swift.org/t/count-of-and-contains-other-for-collection/11245
    @inlinable
    public func contains<T: Collection>(_ other: T) -> Bool where T.Element == Element {
        guard other.startIndex != other.endIndex else { return true }
        
        var currentMainSelfIndex = self.startIndex
        var currentHelperSelfIndex = self.startIndex
        var currentOtherIndex = other.startIndex
        
        while currentMainSelfIndex < self.endIndex {
            while other[currentOtherIndex] == self[currentHelperSelfIndex] {
                guard other.index(after: currentOtherIndex) != other.endIndex else { return true }
                guard self.index(after: currentHelperSelfIndex) != self.endIndex else { return false }
                currentHelperSelfIndex = self.index(after: currentHelperSelfIndex)
                currentOtherIndex = other.index(after: currentOtherIndex)
            }
            currentMainSelfIndex = self.index(after: currentMainSelfIndex)
            currentHelperSelfIndex = currentMainSelfIndex
            currentOtherIndex = other.startIndex
        }
        return false
    }
}
