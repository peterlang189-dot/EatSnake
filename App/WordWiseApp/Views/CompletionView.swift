import SwiftUI

struct CompletionView: View {
    let rememberedCount: Int
    let forgottenCount: Int
    let restartAction: () -> Void

    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 54))
                .foregroundStyle(.green)

            VStack(spacing: 6) {
                Text("今日完成")
                    .font(.title.weight(.bold))
                    .accessibilityIdentifier("completion-title")

                Text("记得 \(rememberedCount) 个，待巩固 \(forgottenCount) 个")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Button(action: restartAction) {
                Label("刷新复习队列", systemImage: "arrow.clockwise")
                    .frame(maxWidth: .infinity)
            }
            .accessibilityIdentifier("restart-session-button")
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.indigo)
        }
        .padding(28)
        .frame(maxWidth: .infinity, minHeight: 360)
        .background(.background, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
