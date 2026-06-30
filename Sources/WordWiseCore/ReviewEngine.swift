import Foundation

public enum ReviewAnswerQuality: Equatable, Sendable {
    case knew
    case forgot
}

public struct ReviewEngine: Sendable {
    public init() {}

    public func progress(
        after answer: ReviewAnswerQuality,
        for progress: WordProgress,
        word: VocabularyWord,
        at date: Date
    ) -> WordProgress {
        var updated = progress
        updated.lastReviewedAt = date

        switch answer {
        case .knew:
            updated.familiarity = min(5, updated.familiarity + familiarityGain(for: word.difficulty))
            updated.correctStreak += 1
            updated.nextReviewAt = date.addingTimeInterval(reviewInterval(for: updated, word: word))
        case .forgot:
            updated.familiarity = max(0, updated.familiarity - 1)
            updated.correctStreak = 0
            updated.wrongCount += 1
            updated.nextReviewAt = date.addingTimeInterval(retryInterval(for: word.difficulty))
        }

        return updated
    }

    public func dueWords(
        from words: [VocabularyWord],
        progressByWordID: [VocabularyWord.ID: WordProgress],
        at date: Date,
        limit: Int
    ) -> [VocabularyWord] {
        let sorted = words.sorted { lhs, rhs in
            let left = progressByWordID[lhs.id]?.nextReviewAt ?? .distantPast
            let right = progressByWordID[rhs.id]?.nextReviewAt ?? .distantPast

            if left == right {
                return lhs.term.localizedCaseInsensitiveCompare(rhs.term) == .orderedAscending
            }

            return left < right
        }

        return sorted
            .filter { word in
                guard let progress = progressByWordID[word.id] else { return true }
                return progress.nextReviewAt <= date && !progress.isMastered
            }
            .prefix(limit)
            .map { $0 }
    }

    private func familiarityGain(for difficulty: VocabularyWord.Difficulty) -> Int {
        switch difficulty {
        case .easy:
            return 2
        case .medium, .hard:
            return 1
        }
    }

    private func reviewInterval(for progress: WordProgress, word: VocabularyWord) -> TimeInterval {
        let day: TimeInterval = 24 * 60 * 60
        let baseDays: Double

        switch progress.familiarity {
        case 0...1:
            baseDays = 1
        case 2:
            baseDays = 2
        case 3:
            baseDays = 4
        case 4:
            baseDays = 7
        default:
            baseDays = 14
        }

        let difficultyMultiplier: Double
        switch word.difficulty {
        case .easy:
            difficultyMultiplier = 1.2
        case .medium:
            difficultyMultiplier = 1.0
        case .hard:
            difficultyMultiplier = 0.7
        }

        return day * baseDays * difficultyMultiplier
    }

    private func retryInterval(for difficulty: VocabularyWord.Difficulty) -> TimeInterval {
        switch difficulty {
        case .easy:
            return 20 * 60
        case .medium:
            return 10 * 60
        case .hard:
            return 5 * 60
        }
    }
}
