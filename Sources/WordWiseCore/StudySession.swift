import Foundation

public struct StudySession: Equatable, Sendable {
    public private(set) var queue: [VocabularyWord]
    public private(set) var currentIndex: Int
    public private(set) var rememberedCount: Int
    public private(set) var forgottenCount: Int

    public var currentWord: VocabularyWord? {
        guard queue.indices.contains(currentIndex) else { return nil }
        return queue[currentIndex]
    }

    public var isComplete: Bool {
        currentIndex >= queue.count
    }

    public var completionRatio: Double {
        guard !queue.isEmpty else { return 1 }
        return Double(min(currentIndex, queue.count)) / Double(queue.count)
    }

    public init(words: [VocabularyWord]) {
        self.queue = words
        self.currentIndex = 0
        self.rememberedCount = 0
        self.forgottenCount = 0
    }

    public mutating func record(_ answer: ReviewAnswerQuality) {
        guard !isComplete else { return }

        switch answer {
        case .knew:
            rememberedCount += 1
        case .forgot:
            forgottenCount += 1
        }

        currentIndex += 1
    }
}
