import Testing
@testable import WordWiseCore

@Test func toeicVocabularyContainsBusinessWordBank() {
    #expect(TOEICVocabulary.words.count >= 80)
    #expect(SampleVocabulary.words == TOEICVocabulary.words)
    #expect(TOEICVocabulary.words.contains { $0.term == "invoice" })
    #expect(TOEICVocabulary.words.contains { $0.term == "itinerary" })
    #expect(TOEICVocabulary.words.contains { $0.term == "reimbursement" })
    #expect(TOEICVocabulary.words.contains { $0.term == "promotion code" })
}

@Test func toeicVocabularyEntriesAreCompleteAndUnique() {
    let ids = TOEICVocabulary.words.map(\.id)

    #expect(Set(ids).count == ids.count)
    #expect(TOEICVocabulary.words.allSatisfy { !$0.id.isEmpty })
    #expect(TOEICVocabulary.words.allSatisfy { !$0.term.isEmpty })
    #expect(TOEICVocabulary.words.allSatisfy { !$0.pronunciation.isEmpty })
    #expect(TOEICVocabulary.words.allSatisfy { !$0.meaning.isEmpty })
    #expect(TOEICVocabulary.words.allSatisfy { !$0.example.isEmpty })
    #expect(TOEICVocabulary.words.allSatisfy { !$0.exampleMeaning.isEmpty })
}
