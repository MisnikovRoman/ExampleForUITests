import XCTest

class MainScreen {
    private let app = XCUIApplication()
    private lazy var title = app.navigationBars.staticTexts["Main"]
    private lazy var redButton = app.buttons["Red"]
    private lazy var blueButton = app.buttons["Blue"]
    private lazy var greenButton = app.buttons["Green"]
    private lazy var itemsButton = app.navigationBars.buttons["Items"]
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
    }
    
    func checkAllComponents() {
        XCTAssertTrue(redButton.exists, "Can't find red button")
        XCTAssertTrue(blueButton.exists, "Can't find blue button")
        XCTAssertTrue(greenButton.exists, "Can't find green button")
        XCTAssertTrue(itemsButton.exists, "Can't find items button")
    }
    
    func goRedScreen() {
        XCTAssertTrue(redButton.isHittable, "Red button isn't clicable")
        redButton.tap()
    }

    func goBlueScreen() {
        XCTAssertTrue(blueButton.isHittable, "Blue button isn't clicable")
        blueButton.tap()
    }
    
    func goGreenScreen() {
        XCTAssertTrue(greenButton.isHittable, "Green button isn't clicable")
        greenButton.tap()
    }
    
    func goItemsScreen() {
        XCTAssertTrue(itemsButton.isHittable, "Items button isn't clicable")
        itemsButton.tap()
    }
}
