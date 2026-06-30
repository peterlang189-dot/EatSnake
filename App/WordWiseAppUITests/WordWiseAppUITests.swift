import XCTest

@MainActor
final class WordWiseAppUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testSnakeGameStartsAndAcceptsDirectionInput() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.otherElements["snake-board"].waitForExistence(timeout: 8))
        XCTAssertTrue(app.staticTexts["game-status"].exists)

        app.buttons["play-pause-button"].tap()
        XCTAssertTrue(app.staticTexts["game-status"].waitForExistence(timeout: 2))

        app.buttons["direction-down"].tap()
        app.buttons["direction-left"].tap()

        XCTAssertTrue(app.otherElements["snake-board"].exists)
    }

    func testSnakeGameResetKeepsBoardPlayable() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.otherElements["snake-board"].waitForExistence(timeout: 8))

        app.buttons["play-pause-button"].tap()
        app.buttons["direction-down"].tap()
        app.buttons["reset-game-button"].tap()

        XCTAssertTrue(app.staticTexts["score-label"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.buttons["play-pause-button"].exists)
        XCTAssertTrue(app.otherElements["snake-board"].exists)
    }
}
