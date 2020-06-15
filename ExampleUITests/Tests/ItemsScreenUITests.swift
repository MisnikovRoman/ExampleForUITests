import XCTest

class ItemsScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let navigate = Navigation()
    private let itemsScreen = ItemsScreen()
    private lazy var mainScreen = MainScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testItemsScreen() {
        navigate.go(to_distanation: .items)
        
        itemsScreen.checkAllComponents()
    }
    
    func testGoBackToMain() {
        navigate.go(to_distanation: .items)
        
        itemsScreen.goBack()
        mainScreen.checkScreen()
    }
}
