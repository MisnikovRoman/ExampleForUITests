import XCTest

class RedScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let navigate = Navigation()
    private let redScreen = RedScreen()
    private lazy var mainScreen = MainScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testRedScreen() {
        navigate.go(to_distanation: .red)
        
        redScreen.checkAllComponents()
    }
    
    func testGoBackToMain() {
        navigate.go(to_distanation: .red)
        
        redScreen.goBack()
        mainScreen.checkScreen()
    }
}
