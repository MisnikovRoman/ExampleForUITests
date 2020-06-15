import XCTest

class MainScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let mainScreen = MainScreen()
    private let navigate = Navigation()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testMainScreen() {
        navigate.go(to_distanation: .main)
        mainScreen.checkAllComponents()
    }
}
