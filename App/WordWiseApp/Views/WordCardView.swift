import SwiftUI
import WordWiseCore

struct WordCardView: View {
    let word: VocabularyWord
    let showsAnswer: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                DifficultyBadge(difficulty: word.difficulty)

                Spacer()

                Image(systemName: showsAnswer ? "eye.fill" : "eye.slash")
                    .foregroundStyle(.secondary)
                    .accessibilityHidden(true)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(word.term)
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .minimumScaleFactor(0.6)
                    .accessibilityIdentifier("word-term")

                Text(word.pronunciation)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }

            Divider()

            VStack(alignment: .leading, spacing: 12) {
                Text(showsAnswer ? word.meaning : "先在心里说出释义，再点开答案")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(showsAnswer ? .primary : .secondary)
                    .accessibilityIdentifier("word-meaning")

                Text(word.example)
                    .font(.body)
                    .foregroundStyle(.primary)

                if showsAnswer {
                    Text(word.exampleMeaning)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(24)
        .frame(maxWidth: .infinity, minHeight: 360, alignment: .topLeading)
        .background(.background, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct DifficultyBadge: View {
    let difficulty: VocabularyWord.Difficulty

    var body: some View {
        Label(title, systemImage: icon)
            .font(.footnote.weight(.semibold))
            .foregroundStyle(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(color.opacity(0.12), in: Capsule())
    }

    private var title: String {
        switch difficulty {
        case .easy:
            return "基础"
        case .medium:
            return "常考"
        case .hard:
            return "挑战"
        }
    }

    private var icon: String {
        switch difficulty {
        case .easy:
            return "leaf"
        case .medium:
            return "bolt"
        case .hard:
            return "flame"
        }
    }

    private var color: Color {
        switch difficulty {
        case .easy:
            return .green
        case .medium:
            return .blue
        case .hard:
            return .red
        }
    }
}
