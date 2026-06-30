import Foundation

public struct WordProgress: Codable, Equatable, Sendable {
    public let wordID: VocabularyWord.ID
    public var familiarity: Int
    public var correctStreak: Int
    public var wrongCount: Int
    public var lastReviewedAt: Date?
    public var nextReviewAt: Date

    public var isMastered: Bool {
        familiarity >= 5 && correctStreak >= 3
    }

    public init(
        wordID: VocabularyWord.ID,
        familiarity: Int = 0,
        correctStreak: Int = 0,
        wrongCount: Int = 0,
        lastReviewedAt: Date? = nil,
        nextReviewAt: Date = .distantPast
    ) {
        self.wordID = wordID
        self.familiarity = familiarity
        self.correctStreak = correctStreak
        self.wrongCount = wrongCount
        self.lastReviewedAt = lastReviewedAt
        self.nextReviewAt = nextReviewAt
    }
}
