import Testing
@testable import WordWiseCore

@Test func sessionTracksAnswersAndCompletionRatio() {
    var session = StudySession(words: [
        makeSessionWord(id: "one"),
        makeSessionWord(id: "two")
    ])

    #expect(session.completionRatio == 0)
    #expect(session.currentWord?.id == "one")

    session.record(.knew)

    #expect(session.rememberedCount == 1)
    #expect(session.forgottenCount == 0)
    #expect(session.completionRatio == 0.5)
    #expect(session.currentWord?.id == "two")

    session.record(.forgot)

    #expect(session.rememberedCount == 1)
    #expect(session.forgottenCount == 1)
    #expect(session.isComplete)
    #expect(session.currentWord == nil)
    #expect(session.completionRatio == 1)
}

@Test func emptySessionIsAlreadyComplete() {
    let session = StudySession(words: [])

    #expect(session.isComplete)
    #expect(session.currentWord == nil)
    #expect(session.completionRatio == 1)
}

private func makeSessionWord(id: String) -> VocabularyWord {
    VocabularyWord(
        id: id,
        term: id,
        pronunciation: "",
        meaning: "",
        example: "",
        exampleMeaning: "",
        difficulty: .easy
    )
}
