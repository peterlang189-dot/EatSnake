import Foundation
import WordWiseCore

@MainActor
final class StudyViewModel: ObservableObject {
    @Published private(set) var store: StudyStore
    @Published private(set) var session: StudySession
    @Published var showsAnswer = false
    @Published var alertMessage: String?

    private let dailyLimit = 8

    var currentWord: VocabularyWord? {
        session.currentWord
    }

    var rememberedCount: Int {
        session.rememberedCount
    }

    var forgottenCount: Int {
        session.forgottenCount
    }

    var studiedTodayCount: Int {
        session.rememberedCount + session.forgottenCount
    }

    var totalCount: Int {
        store.words.count
    }

    var masteredCount: Int {
        store.masteredCount
    }

    var completionRatio: Double {
        session.completionRatio
    }

    init(store: StudyStore? = nil) {
        if ProcessInfo.processInfo.arguments.contains("-uiTestingReset") {
            try? FileManager.default.removeItem(at: Self.progressURL)
        }

        let initialStore = store ?? StudyStore(persistence: FileProgressStore(url: Self.progressURL))
        self.store = initialStore
        self.session = StudySession(words: initialStore.dueWords(limit: dailyLimit))
    }

    func revealAnswer() {
        showsAnswer = true
    }

    func record(_ answer: ReviewAnswerQuality) {
        guard let word = session.currentWord else { return }

        do {
            try store.record(answer, for: word)
            session.record(answer)
            showsAnswer = false
        } catch {
            alertMessage = "保存学习进度失败：\(error.localizedDescription)"
        }
    }

    func restartSession() {
        session = StudySession(words: store.dueWords(limit: dailyLimit))
        showsAnswer = false
    }

    func resetAllProgress() {
        do {
            try store.reset()
            restartSession()
        } catch {
            alertMessage = "重置失败：\(error.localizedDescription)"
        }
    }

    private static var progressURL: URL {
        let directory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        return directory
            .appendingPathComponent("WordWise", isDirectory: true)
            .appendingPathComponent("progress.json")
    }
}
