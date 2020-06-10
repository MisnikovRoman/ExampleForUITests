import XCTest

class MainScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let mainScreen = MainScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testMainScreen() {
        mainScreen.checkScreen()
        mainScreen.checkAllComponents()
    }
}
