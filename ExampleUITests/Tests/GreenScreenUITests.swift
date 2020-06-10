import XCTest

class GreenScreenUITests: Navigation {

    private let app = XCUIApplication()
    private let greenScreen = GreenScreen()
    private lazy var mainScreen = MainScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testGreenScreen() {
        super.NavigationToGreenScreen()
        
        greenScreen.checkAllComponents()
    }
    
    func testGoBackToMain() {
        super.NavigationToGreenScreen()
        
        greenScreen.goBack()
        mainScreen.checkScreen()
    }
}
