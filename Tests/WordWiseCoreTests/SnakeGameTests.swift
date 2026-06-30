import Testing
@testable import WordWiseCore

@Test func snakeStartsReadyWithFoodAhead() {
    let game = SnakeGame(columns: 10, rows: 10)

    #expect(game.state.status == .ready)
    #expect(game.state.snake.count == 3)
    #expect(game.state.direction == .right)
    #expect(game.state.food == GridPoint(x: 8, y: 5))
}

@Test func snakeEatsFoodAndGrows() {
    var game = SnakeGame(columns: 10, rows: 10)
    game.start()

    game.step()
    game.step()

    #expect(game.state.score == 1)
    #expect(game.state.bestScore == 1)
    #expect(game.state.snake.count == 4)
    #expect(game.state.status == .running)
}

@Test func snakeIgnoresReverseTurn() {
    var game = SnakeGame(columns: 10, rows: 10)
    game.start()

    game.turn(.left)
    game.step()

    #expect(game.state.direction == .right)
    #expect(game.state.status == .running)
}

@Test func snakeHitsWallAndGameEnds() {
    let state = SnakeGameState(
        columns: 6,
        rows: 6,
        snake: [GridPoint(x: 5, y: 2), GridPoint(x: 4, y: 2), GridPoint(x: 3, y: 2)],
        direction: .right,
        queuedDirection: .right,
        food: GridPoint(x: 1, y: 1),
        status: .running
    )
    var game = SnakeGame(state: state)

    game.step()

    #expect(game.state.status == .gameOver)
}

@Test func snakeMayMoveIntoTailWhenNotGrowing() {
    let state = SnakeGameState(
        columns: 6,
        rows: 6,
        snake: [
            GridPoint(x: 2, y: 2),
            GridPoint(x: 2, y: 3),
            GridPoint(x: 1, y: 3),
            GridPoint(x: 1, y: 2)
        ],
        direction: .up,
        queuedDirection: .left,
        food: GridPoint(x: 5, y: 5),
        status: .running
    )
    var game = SnakeGame(state: state)

    game.step()

    #expect(game.state.status == .running)
    #expect(game.state.head == GridPoint(x: 1, y: 2))
}

@Test func snakeCollidesWithBodyWhenGrowing() {
    let state = SnakeGameState(
        columns: 6,
        rows: 6,
        snake: [
            GridPoint(x: 2, y: 2),
            GridPoint(x: 2, y: 3),
            GridPoint(x: 1, y: 3),
            GridPoint(x: 1, y: 2)
        ],
        direction: .up,
        queuedDirection: .left,
        food: GridPoint(x: 1, y: 2),
        status: .running
    )
    var game = SnakeGame(state: state)

    game.step()

    #expect(game.state.status == .gameOver)
}
