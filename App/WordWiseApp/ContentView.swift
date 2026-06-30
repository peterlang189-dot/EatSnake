import SwiftUI
import WordWiseCore

struct ContentView: View {
    @EnvironmentObject private var model: StudyViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    ProgressHeaderView()

                    if let word = model.currentWord {
                        WordCardView(word: word, showsAnswer: model.showsAnswer)

                        StudyControlsView(
                            showsAnswer: model.showsAnswer,
                            revealAction: model.revealAnswer,
                            forgotAction: { model.record(.forgot) },
                            knewAction: { model.record(.knew) }
                        )
                    } else {
                        CompletionView(
                            rememberedCount: model.rememberedCount,
                            forgottenCount: model.forgottenCount,
                            restartAction: model.restartSession
                        )
                    }
                }
                .padding()
                .frame(maxWidth: 560)
                .accessibilityIdentifier("study-screen")
            }
            .navigationTitle("WordWise")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button(role: .destructive, action: model.resetAllProgress) {
                            Label("重置进度", systemImage: "arrow.counterclockwise")
                        }
                        .accessibilityIdentifier("reset-progress-button")
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                    .accessibilityLabel("更多")
                }
            }
            .alert(
                "提示",
                isPresented: Binding(
                    get: { model.alertMessage != nil },
                    set: { if !$0 { model.alertMessage = nil } }
                )
            ) {
                Button("好", role: .cancel) {}
            } message: {
                Text(model.alertMessage ?? "")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(StudyViewModel(store: StudyStore()))
}
