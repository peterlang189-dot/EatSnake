import Foundation

public struct GridPoint: Codable, Equatable, Hashable, Sendable {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    func moved(_ direction: SnakeDirection) -> GridPoint {
        let delta = direction.delta
        return GridPoint(x: x + delta.x, y: y + delta.y)
    }
}

public enum SnakeDirection: String, Codable, CaseIterable, Sendable {
    case up
    case down
    case left
    case right

    var delta: (x: Int, y: Int) {
        switch self {
        case .up:
            return (0, -1)
        case .down:
            return (0, 1)
        case .left:
            return (-1, 0)
        case .right:
            return (1, 0)
        }
    }

    func isOpposite(of other: SnakeDirection) -> Bool {
        switch (self, other) {
        case (.up, .down), (.down, .up), (.left, .right), (.right, .left):
            return true
        default:
            return false
        }
    }
}

public enum SnakeGameStatus: String, Codable, Sendable {
    case ready
    case running
    case paused
    case gameOver
    case won
}

public struct SnakeGameState: Codable, Equatable, Sendable {
    public let columns: Int
    public let rows: Int
    public var snake: [GridPoint]
    public var direction: SnakeDirection
    public var queuedDirection: SnakeDirection
    public var food: GridPoint?
    public var score: Int
    public var bestScore: Int
    public var status: SnakeGameStatus

    public var head: GridPoint {
        snake[0]
    }

    public var isFinished: Bool {
        status == .gameOver || status == .won
    }

    public init(
        columns: Int,
        rows: Int,
        snake: [GridPoint],
        direction: SnakeDirection = .right,
        queuedDirection: SnakeDirection = .right,
        food: GridPoint?,
        score: Int = 0,
        bestScore: Int = 0,
        status: SnakeGameStatus = .ready
    ) {
        self.columns = columns
        self.rows = rows
        self.snake = snake
        self.direction = direction
        self.queuedDirection = queuedDirection
        self.food = food
        self.score = score
        self.bestScore = bestScore
        self.status = status
    }
}

public struct SnakeGame: Sendable {
    public private(set) var state: SnakeGameState

    public init(columns: Int = 20, rows: Int = 20, bestScore: Int = 0) {
        precondition(columns >= 6 && rows >= 6, "Snake board must be at least 6x6.")

        let centerX = columns / 2
        let centerY = rows / 2
        let snake = [
            GridPoint(x: centerX + 1, y: centerY),
            GridPoint(x: centerX, y: centerY),
            GridPoint(x: centerX - 1, y: centerY)
        ]
        let firstFood = GridPoint(x: min(centerX + 3, columns - 1), y: centerY)

        state = SnakeGameState(
            columns: columns,
            rows: rows,
            snake: snake,
            food: firstFood,
            bestScore: bestScore
        )
    }

    public init(state: SnakeGameState) {
        self.state = state
    }

    public mutating func start() {
        guard !state.isFinished else { return }
        state.status = .running
    }

    public mutating func pause() {
        guard state.status == .running else { return }
        state.status = .paused
    }

    public mutating func turn(_ direction: SnakeDirection) {
        guard !direction.isOpposite(of: state.direction) else { return }
        state.queuedDirection = direction
        if state.status == .ready || state.status == .paused {
            state.status = .running
        }
    }

    public mutating func step() {
        guard state.status == .running else { return }

        state.direction = state.queuedDirection
        let nextHead = state.head.moved(state.direction)

        guard isInsideBoard(nextHead) else {
            finish(as: .gameOver)
            return
        }

        let eatsFood = nextHead == state.food
        var bodyForCollision = state.snake
        if !eatsFood {
            bodyForCollision.removeLast()
        }

        guard !bodyForCollision.contains(nextHead) else {
            finish(as: .gameOver)
            return
        }

        state.snake.insert(nextHead, at: 0)

        if eatsFood {
            state.score += 1
            state.bestScore = max(state.bestScore, state.score)
            placeFood()
        } else {
            state.snake.removeLast()
        }
    }

    public mutating func reset(keepingBestScore: Bool = true) {
        let bestScore = keepingBestScore ? state.bestScore : 0
        self = SnakeGame(columns: state.columns, rows: state.rows, bestScore: bestScore)
    }

    public mutating func forceFood(at point: GridPoint?) {
        guard let point else {
            state.food = nil
            return
        }
        guard isInsideBoard(point), !state.snake.contains(point) else { return }
        state.food = point
    }

    private mutating func placeFood() {
        let occupied = Set(state.snake)
        let available = (0..<state.rows).flatMap { y in
            (0..<state.columns).map { x in GridPoint(x: x, y: y) }
        }
        .filter { !occupied.contains($0) }

        guard let nextFood = available.randomElement() else {
            finish(as: .won)
            return
        }

        state.food = nextFood
    }

    private func isInsideBoard(_ point: GridPoint) -> Bool {
        point.x >= 0 && point.x < state.columns && point.y >= 0 && point.y < state.rows
    }

    private mutating func finish(as status: SnakeGameStatus) {
        state.status = status
        state.bestScore = max(state.bestScore, state.score)
    }
}
