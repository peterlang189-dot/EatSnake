import Foundation

public struct VocabularyWord: Identifiable, Codable, Equatable, Sendable {
    public enum Difficulty: String, Codable, CaseIterable, Sendable {
        case easy
        case medium
        case hard
    }

    public let id: String
    public let term: String
    public let pronunciation: String
    public let meaning: String
    public let example: String
    public let exampleMeaning: String
    public let difficulty: Difficulty

    public init(
        id: String,
        term: String,
        pronunciation: String,
        meaning: String,
        example: String,
        exampleMeaning: String,
        difficulty: Difficulty
    ) {
        self.id = id
        self.term = term
        self.pronunciation = pronunciation
        self.meaning = meaning
        self.example = example
        self.exampleMeaning = exampleMeaning
        self.difficulty = difficulty
    }
}
