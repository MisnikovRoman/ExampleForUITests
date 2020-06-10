import XCTest

class NavigationTests: Navigation {
    
    private let app = XCUIApplication()

    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testNavigationToItemsScreen() {
        super.NavigationToItemsScreen()
    }

    func testNavigationToRedScreen() {
        super.NavigationToRedScreen()
    }
    
    func testNavigationToBlueScreen() {
        super.NavigationToBlueScreen()
    }

    func testNavigationToGreenScreen() {
        super.NavigationToGreenScreen()
    }
    
    func testNavigationToBlueScreenThrowGreenScreen() {
        super.NavigationToBlueScreenThrowGreenScreen()
    }
}
