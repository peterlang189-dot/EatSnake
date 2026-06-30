import Testing
@testable import WordWiseCore
import Foundation

@Test func recordPersistsProgress() throws {
    let persistence = MemoryProgressStore()
    let word = storeWord(id: "focused")
    let store = StudyStore(words: [word], persistence: persistence)
    let now = Date(timeIntervalSince1970: 1_800_000_100)

    try store.record(.knew, for: word, at: now)

    let saved = try #require(persistence.saved[word.id])
    #expect(saved.familiarity == 1)
    #expect(saved.lastReviewedAt == now)
}

@Test func resetClearsProgress() throws {
    let word = storeWord(id: "focused")
    let persistence = MemoryProgressStore(initial: [
        word.id: WordProgress(wordID: word.id, familiarity: 3)
    ])
    let store = StudyStore(words: [word], persistence: persistence)

    try store.reset()

    #expect(store.progressByWordID.isEmpty)
    #expect(persistence.saved.isEmpty)
}

private final class MemoryProgressStore: ProgressPersisting, @unchecked Sendable {
    var saved: [VocabularyWord.ID: WordProgress]

    init(initial: [VocabularyWord.ID: WordProgress] = [:]) {
        self.saved = initial
    }

    func load() throws -> [VocabularyWord.ID: WordProgress] {
        saved
    }

    func save(_ progress: [VocabularyWord.ID: WordProgress]) throws {
        saved = progress
    }
}

private func storeWord(id: String) -> VocabularyWord {
    VocabularyWord(
        id: id,
        term: id,
        pronunciation: "",
        meaning: "",
        example: "",
        exampleMeaning: "",
        difficulty: .medium
    )
}
