import Foundation
import WordWiseCore

@MainActor
final class SnakeViewModel: ObservableObject {
    @Published private(set) var game = SnakeGame()

    private var timer: Timer?

    var state: SnakeGameState {
        game.state
    }

    var statusText: String {
        switch state.status {
        case .ready:
            return "准备"
        case .running:
            return "进行中"
        case .paused:
            return "暂停"
        case .gameOver:
            return "结束"
        case .won:
            return "通关"
        }
    }

    func toggleRunning() {
        if state.status == .running {
            game.pause()
            stopTimer()
        } else {
            game.start()
            startTimer()
        }
    }

    func turn(_ direction: SnakeDirection) {
        game.turn(direction)
        startTimer()
    }

    func reset() {
        game.reset()
        startTimerIfNeeded()
    }

    func step() {
        game.step()
        if state.isFinished {
            stopTimer()
        }
    }

    private func startTimerIfNeeded() {
        guard state.status == .running else { return }
        startTimer()
    }

    private func startTimer() {
        guard state.status == .running, timer == nil else { return }

        timer = Timer.scheduledTimer(withTimeInterval: 0.18, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.step()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
