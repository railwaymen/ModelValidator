import Foundation

extension Collection where Element: Equatable {
    func ends(with collection: [Element]) -> Bool {
        let indexOffset = self.count - collection.count
        guard indexOffset >= 0 else { return false }
        let endingCollection = self.dropFirst(indexOffset)
        guard !endingCollection.isEmpty else { return false }
        return endingCollection.elementsEqual(collection)
    }
}
