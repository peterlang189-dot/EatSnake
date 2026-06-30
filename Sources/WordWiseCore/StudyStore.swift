import Foundation

public protocol ProgressPersisting: Sendable {
    func load() throws -> [VocabularyWord.ID: WordProgress]
    func save(_ progress: [VocabularyWord.ID: WordProgress]) throws
}

public final class StudyStore {
    public private(set) var words: [VocabularyWord]
    public private(set) var progressByWordID: [VocabularyWord.ID: WordProgress]

    private let persistence: ProgressPersisting?
    private let engine: ReviewEngine

    public var masteredCount: Int {
        progressByWordID.values.filter(\.isMastered).count
    }

    public var reviewedCount: Int {
        progressByWordID.values.filter { $0.lastReviewedAt != nil }.count
    }

    public init(
        words: [VocabularyWord] = SampleVocabulary.words,
        progressByWordID: [VocabularyWord.ID: WordProgress] = [:],
        persistence: ProgressPersisting? = nil,
        engine: ReviewEngine = ReviewEngine()
    ) {
        self.words = words
        self.progressByWordID = progressByWordID
        self.persistence = persistence
        self.engine = engine
    }

    public convenience init(
        words: [VocabularyWord] = SampleVocabulary.words,
        persistence: ProgressPersisting,
        engine: ReviewEngine = ReviewEngine()
    ) {
        let loaded = (try? persistence.load()) ?? [:]
        self.init(
            words: words,
            progressByWordID: loaded,
            persistence: persistence,
            engine: engine
        )
    }

    public func dueWords(at date: Date = Date(), limit: Int = 10) -> [VocabularyWord] {
        engine.dueWords(
            from: words,
            progressByWordID: progressByWordID,
            at: date,
            limit: limit
        )
    }

    public func progress(for word: VocabularyWord) -> WordProgress {
        progressByWordID[word.id] ?? WordProgress(wordID: word.id)
    }

    public func record(_ answer: ReviewAnswerQuality, for word: VocabularyWord, at date: Date = Date()) throws {
        let updated = engine.progress(
            after: answer,
            for: progress(for: word),
            word: word,
            at: date
        )
        progressByWordID[word.id] = updated
        try persistence?.save(progressByWordID)
    }

    public func reset() throws {
        progressByWordID = [:]
        try persistence?.save(progressByWordID)
    }
}
