import XCTest

@MainActor
final class WordWiseAppUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testRevealAndMarkKnownFlow() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-uiTestingReset"]
        app.launch()

        XCTAssertTrue(waitForStudyCard(in: app))

        button("reveal-answer-button", fallback: "显示答案", in: app).tap()
        XCTAssertTrue(button("knew-button", fallback: "认识", in: app).waitForExistence(timeout: 2))

        button("knew-button", fallback: "认识", in: app).tap()
        XCTAssertTrue(
            button("reveal-answer-button", fallback: "显示答案", in: app).waitForExistence(timeout: 2)
            || completionTitle(in: app).waitForExistence(timeout: 2)
        )
    }

    func testForgotFlowKeepsStudyMoving() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-uiTestingReset"]
        app.launch()

        XCTAssertTrue(waitForStudyCard(in: app))

        button("reveal-answer-button", fallback: "显示答案", in: app).tap()
        button("forgot-button", fallback: "不认识", in: app).tap()

        XCTAssertTrue(
            button("reveal-answer-button", fallback: "显示答案", in: app).waitForExistence(timeout: 2)
            || completionTitle(in: app).waitForExistence(timeout: 2)
        )
    }

    func testVisualScrollAudit() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-uiTestingReset"]
        app.launch()

        XCTAssertTrue(waitForStudyCard(in: app))
        capture("01-initial-study-card", app: app)

        app.swipeUp()
        capture("02-after-swipe-up-on-study-card", app: app)

        app.swipeDown()
        capture("03-after-swipe-down-on-study-card", app: app)

        button("reveal-answer-button", fallback: "显示答案", in: app).tap()
        XCTAssertTrue(button("knew-button", fallback: "认识", in: app).waitForExistence(timeout: 2))
        capture("04-answer-visible", app: app)

        finishCurrentQueue(in: app)
        XCTAssertTrue(completionTitle(in: app).waitForExistence(timeout: 5))
        capture("05-completion-screen", app: app)

        app.swipeUp()
        capture("06-after-swipe-up-on-completion", app: app)

        tapMoreMenu(in: app)
        XCTAssertTrue(app.buttons["重置进度"].waitForExistence(timeout: 2))
        capture("07-more-menu-reset-action", app: app)

        app.buttons["重置进度"].tap()
        XCTAssertTrue(waitForStudyCard(in: app))
        capture("08-after-reset-back-to-study", app: app)
    }

    private func waitForStudyCard(in app: XCUIApplication) -> Bool {
        button("reveal-answer-button", fallback: "显示答案", in: app).waitForExistence(timeout: 8)
    }

    private func button(_ identifier: String, fallback: String, in app: XCUIApplication) -> XCUIElement {
        let element = app.buttons[identifier]
        return element.exists ? element : app.buttons[fallback]
    }

    private func completionTitle(in app: XCUIApplication) -> XCUIElement {
        let element = app.staticTexts["completion-title"]
        return element.exists ? element : app.staticTexts["今日完成"]
    }

    private func finishCurrentQueue(in app: XCUIApplication) {
        for _ in 0..<12 {
            if completionTitle(in: app).exists {
                return
            }

            let revealButton = button("reveal-answer-button", fallback: "显示答案", in: app)
            if revealButton.waitForExistence(timeout: 2) {
                revealButton.tap()
            }

            let knewButton = button("knew-button", fallback: "认识", in: app)
            if knewButton.waitForExistence(timeout: 2) {
                knewButton.tap()
            }
        }
    }

    private func tapMoreMenu(in app: XCUIApplication) {
        app.coordinate(withNormalizedOffset: CGVector(dx: 0.92, dy: 0.09)).tap()
    }

    private func capture(_ name: String, app: XCUIApplication) {
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
