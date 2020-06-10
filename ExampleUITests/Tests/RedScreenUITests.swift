import XCTest

class RedScreenUITests: Navigation {

    private let app = XCUIApplication()
    private let redScreen = RedScreen()
    private lazy var mainScreen = MainScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testGreenScreen() {
        super.NavigationToRedScreen()
        
        redScreen.checkAllComponents()
    }
    
    func testGoBackToMain() {
        super.NavigationToGreenScreen()
        
        redScreen.goBack()
        mainScreen.checkScreen()
    }
}
