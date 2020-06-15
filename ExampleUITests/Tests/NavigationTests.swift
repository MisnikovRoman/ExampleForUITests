import XCTest

class NavigationTests: XCTestCase {
    
    private let app = XCUIApplication()
    private let navigate = Navigation()

    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testNavigationToItemsScreen() {
        navigate.go(to_distanation: .items)
    }

    func testNavigationToRedScreen() {
        navigate.go(to_distanation: .red)
    }
    
    func testNavigationToBlueScreen() {
        navigate.go(to_distanation: .blue)
    }

    func testNavigationToGreenScreen() {
        navigate.go(to_distanation: .green)
    }
    
    func testNavigationToBlueScreenThrowGreenScreen() {
        navigate.go(to_distanation: .blue, throw_screen: .green)
    }
}
