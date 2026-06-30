import Testing
@testable import WordWiseCore
import Foundation

private let engine = ReviewEngine()
private let now = Date(timeIntervalSince1970: 1_800_000_000)

@Test func knewAnswerIncreasesFamiliarityAndSchedulesFutureReview() {
    let word = makeWord(difficulty: .medium)
    let progress = WordProgress(wordID: word.id, familiarity: 2, correctStreak: 1)

    let updated = engine.progress(after: .knew, for: progress, word: word, at: now)

    #expect(updated.familiarity == 3)
    #expect(updated.correctStreak == 2)
    #expect(updated.wrongCount == 0)
    #expect(updated.lastReviewedAt == now)
    #expect(updated.nextReviewAt == now.addingTimeInterval(4 * 24 * 60 * 60))
}

@Test func easyWordGainsFamiliarityFaster() {
    let word = makeWord(difficulty: .easy)
    let progress = WordProgress(wordID: word.id, familiarity: 1)

    let updated = engine.progress(after: .knew, for: progress, word: word, at: now)

    #expect(updated.familiarity == 3)
}

@Test func forgotAnswerResetsStreakAndSchedulesQuickRetry() {
    let word = makeWord(difficulty: .hard)
    let progress = WordProgress(wordID: word.id, familiarity: 4, correctStreak: 2)

    let updated = engine.progress(after: .forgot, for: progress, word: word, at: now)

    #expect(updated.familiarity == 3)
    #expect(updated.correctStreak == 0)
    #expect(updated.wrongCount == 1)
    #expect(updated.nextReviewAt == now.addingTimeInterval(5 * 60))
}

@Test func dueWordsPreferOldestReviewDateAndSkipMasteredWords() {
    let alpha = makeWord(id: "alpha", term: "alpha", difficulty: .medium)
    let beta = makeWord(id: "beta", term: "beta", difficulty: .medium)
    let mastered = makeWord(id: "mastered", term: "mastered", difficulty: .medium)

    let progressByID = [
        alpha.id: WordProgress(wordID: alpha.id, nextReviewAt: now.addingTimeInterval(-20)),
        beta.id: WordProgress(wordID: beta.id, nextReviewAt: now.addingTimeInterval(-60)),
        mastered.id: WordProgress(
            wordID: mastered.id,
            familiarity: 5,
            correctStreak: 3,
            nextReviewAt: now.addingTimeInterval(-100)
        )
    ]

    let due = engine.dueWords(
        from: [alpha, mastered, beta],
        progressByWordID: progressByID,
        at: now,
        limit: 10
    )

    #expect(due.map(\.id) == [beta.id, alpha.id])
}

@Test func dueWordsIncludeNewWords() {
    let alpha = makeWord(id: "alpha", term: "alpha", difficulty: .medium)
    let beta = makeWord(id: "beta", term: "beta", difficulty: .medium)

    let due = engine.dueWords(from: [beta, alpha], progressByWordID: [:], at: now, limit: 1)

    #expect(due == [alpha])
}

private func makeWord(
    id: String = "word",
    term: String = "word",
    difficulty: VocabularyWord.Difficulty
) -> VocabularyWord {
    VocabularyWord(
        id: id,
        term: term,
        pronunciation: "/wɜːrd/",
        meaning: "单词",
        example: "This is a word.",
        exampleMeaning: "这是一个单词。",
        difficulty: difficulty
    )
}
