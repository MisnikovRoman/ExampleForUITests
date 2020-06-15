import XCTest

class GreenScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let navigate = Navigation()
    private let greenScreen = GreenScreen()
    private lazy var mainScreen = MainScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testGreenScreen() {
        navigate.go(to_distanation: .green)
        
        greenScreen.checkAllComponents()
    }
    
    func testGoBackToMain() {
        navigate.go(to_distanation: .green)
        
        greenScreen.goBack()
        mainScreen.checkScreen()
    }
}
