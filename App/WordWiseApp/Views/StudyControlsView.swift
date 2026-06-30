import SwiftUI

struct StudyControlsView: View {
    let showsAnswer: Bool
    let revealAction: () -> Void
    let forgotAction: () -> Void
    let knewAction: () -> Void

    var body: some View {
        if showsAnswer {
            HStack(spacing: 12) {
            Button(action: forgotAction) {
                Label("不认识", systemImage: "xmark")
                    .frame(maxWidth: .infinity)
            }
            .accessibilityIdentifier("forgot-button")
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.orange)

            Button(action: knewAction) {
                Label("认识", systemImage: "checkmark")
                    .frame(maxWidth: .infinity)
            }
            .accessibilityIdentifier("knew-button")
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.indigo)
            }
        } else {
        Button(action: revealAction) {
            Label("显示答案", systemImage: "eye")
                .frame(maxWidth: .infinity)
        }
        .accessibilityIdentifier("reveal-answer-button")
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(.indigo)
        }
    }
}
