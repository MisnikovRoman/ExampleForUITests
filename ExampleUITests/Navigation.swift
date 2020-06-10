import XCTest

class Navigation: XCTestCase {
    
    private let app = XCUIApplication()
    private let mainScreen = MainScreen()
    private lazy var blueScreen = BlueScreen()
    private lazy var redScreen = RedScreen()
    private lazy var greenScreen = GreenScreen()
    private lazy var itemsScreen = ItemsScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func NavigationToItemsScreen() {
        mainScreen.checkScreen()
        mainScreen.goItemsScreen()
        itemsScreen.checkScreen()
    }

    func NavigationToRedScreen() {
        mainScreen.checkScreen()
        mainScreen.goRedScreen()
        redScreen.checkScreen()
    }
    
    func NavigationToBlueScreen() {
        mainScreen.checkScreen()
        mainScreen.goBlueScreen()
        blueScreen.checkScreen()
    }

    func NavigationToGreenScreen() {
        mainScreen.checkScreen()
        mainScreen.goGreenScreen()
        greenScreen.checkScreen()
    }
    
    func NavigationToBlueScreenThrowGreenScreen() {
        mainScreen.checkScreen()
        mainScreen.goGreenScreen()
        greenScreen.checkScreen()
        greenScreen.goBlueScreen()
        blueScreen.checkScreen()
    }
}
