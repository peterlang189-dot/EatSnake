import SwiftUI
import WordWiseCore

struct ContentView: View {
    @EnvironmentObject private var model: SnakeViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack(spacing: 18) {
                    ScoreBarView(model: model)

                    SnakeBoardView(state: model.state)
                        .accessibilityIdentifier("snake-board")
                        .gesture(
                            DragGesture(minimumDistance: 24)
                                .onEnded { value in
                                    handleSwipe(value.translation)
                                }
                        )

                    GameControlsView(
                        status: model.state.status,
                        turn: model.turn,
                        toggleRunning: model.toggleRunning,
                        reset: model.reset
                    )
                }
                .padding()
                .frame(maxWidth: 560)
            }
            .navigationTitle("Snake")
        }
    }

    private func handleSwipe(_ translation: CGSize) {
        if abs(translation.width) > abs(translation.height) {
            model.turn(translation.width > 0 ? .right : .left)
        } else {
            model.turn(translation.height > 0 ? .down : .up)
        }
    }
}

private struct ScoreBarView: View {
    @ObservedObject var model: SnakeViewModel

    var body: some View {
        HStack(spacing: 12) {
            StatView(title: "分数", value: "\(model.state.score)")
                .accessibilityIdentifier("score-label")
            StatView(title: "最佳", value: "\(model.state.bestScore)")
                .accessibilityIdentifier("best-score-label")
            StatView(title: "状态", value: model.statusText)
                .accessibilityIdentifier("game-status")
        }
    }
}

private struct StatView: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title3.weight(.bold))
                .monospacedDigit()
                .foregroundStyle(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
        .frame(maxWidth: .infinity, minHeight: 58)
        .background(.background, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct SnakeBoardView: View {
    let state: SnakeGameState

    private var cells: [GridPoint] {
        (0..<state.rows).flatMap { y in
            (0..<state.columns).map { x in GridPoint(x: x, y: y) }
        }
    }

    var body: some View {
        GeometryReader { proxy in
            let cellSize = floor(min(proxy.size.width, proxy.size.height) / CGFloat(state.columns))
            let boardSize = cellSize * CGFloat(state.columns)

            LazyVGrid(
                columns: Array(
                    repeating: GridItem(.fixed(cellSize), spacing: 0),
                    count: state.columns
                ),
                spacing: 0
            ) {
                ForEach(cells, id: \.self) { point in
                    Rectangle()
                        .fill(color(for: point))
                        .frame(width: cellSize, height: cellSize)
                        .overlay(
                            Rectangle()
                                .stroke(.black.opacity(0.08), lineWidth: 0.5)
                        )
                }
            }
            .frame(width: boardSize, height: boardSize)
            .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
        }
        .aspectRatio(1, contentMode: .fit)
        .background(Color(red: 0.10, green: 0.13, blue: 0.16), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .overlay(alignment: .center) {
            if state.status == .gameOver || state.status == .won {
                Text(state.status == .won ? "通关" : "游戏结束")
                    .font(.largeTitle.weight(.heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(.black.opacity(0.58), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .accessibilityIdentifier("game-over-label")
            }
        }
    }

    private func color(for point: GridPoint) -> Color {
        if point == state.head {
            return Color(red: 0.37, green: 0.88, blue: 0.45)
        }

        if state.snake.contains(point) {
            return Color(red: 0.20, green: 0.68, blue: 0.34)
        }

        if point == state.food {
            return Color(red: 0.96, green: 0.31, blue: 0.25)
        }

        return Color(red: 0.86, green: 0.89, blue: 0.91)
    }
}

private struct GameControlsView: View {
    let status: SnakeGameStatus
    let turn: (SnakeDirection) -> Void
    let toggleRunning: () -> Void
    let reset: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                Button(action: toggleRunning) {
                    Image(systemName: status == .running ? "pause.fill" : "play.fill")
                        .frame(width: 22, height: 22)
                }
                .accessibilityIdentifier("play-pause-button")
                .accessibilityLabel(status == .running ? "暂停" : "开始")
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.green)

                Button(action: reset) {
                    Image(systemName: "arrow.clockwise")
                        .frame(width: 22, height: 22)
                }
                .accessibilityIdentifier("reset-game-button")
                .accessibilityLabel("重开")
                .buttonStyle(.bordered)
                .controlSize(.large)
            }

            VStack(spacing: 8) {
                DirectionButton(systemName: "arrowtriangle.up.fill", identifier: "direction-up") {
                    turn(.up)
                }

                HStack(spacing: 8) {
                    DirectionButton(systemName: "arrowtriangle.left.fill", identifier: "direction-left") {
                        turn(.left)
                    }
                    DirectionButton(systemName: "arrowtriangle.down.fill", identifier: "direction-down") {
                        turn(.down)
                    }
                    DirectionButton(systemName: "arrowtriangle.right.fill", identifier: "direction-right") {
                        turn(.right)
                    }
                }
            }
        }
    }
}

private struct DirectionButton: View {
    let systemName: String
    let identifier: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.title3.weight(.bold))
                .frame(width: 58, height: 44)
        }
        .accessibilityIdentifier(identifier)
        .buttonStyle(.bordered)
        .controlSize(.large)
    }
}

#Preview {
    ContentView()
        .environmentObject(SnakeViewModel())
}
