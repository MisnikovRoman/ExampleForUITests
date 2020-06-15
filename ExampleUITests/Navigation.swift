import XCTest

class Navigation {
    
    private let app = XCUIApplication()
    private let mainScreen = MainScreen()
    private lazy var blueScreen = BlueScreen()
    private lazy var redScreen = RedScreen()
    private lazy var greenScreen = GreenScreen()
    private lazy var itemsScreen = ItemsScreen()
    
    func go(to_distanation: Screens) {
        switch to_distanation {
        case .main:
            self.navigateToMainScreen()
        case .blue:
            self.navigateToBlueScreen()
        case .green:
            self.navigateToGreenScreen()
        case .red:
            self.navigateToRedScreen()
        case .items:
            self.navigateToItemsScreen()
        }
    }
    
    func go(to_distanation: Screens, throw_screen: Screens) {
        switch to_distanation {
        case .blue:
            switch throw_screen {
            case .green:
                self.navigateToBlueScreenThrowGreenScreen()
            case .main:
                self.navigateToBlueScreen()
            default:
                XCTFail("Can't go to \(to_distanation) screen throw \(throw_screen)")
            }
        case .main:
            XCTFail("Can't go to \(to_distanation) screen throw \(throw_screen)")
        case .red:
            switch throw_screen {
            case .main:
                self.navigateToRedScreen()
            default:
                XCTFail("Can't go to \(to_distanation) screen throw \(throw_screen)")
            }
        case .green:
            switch throw_screen {
            case .main:
                self.navigateToGreenScreen()
            default:
                XCTFail("Can't go to \(to_distanation) screen throw \(throw_screen)")
            }
        case .items:
            switch throw_screen {
            case .main:
                self.navigateToItemsScreen()
            default:
                XCTFail("Can't go to \(to_distanation) screen throw \(throw_screen)")
            }
        }
    }

    private func navigateToMainScreen() {
        mainScreen.checkScreen()
    }
    
    private func navigateToItemsScreen() {
        mainScreen.checkScreen()
        mainScreen.goItemsScreen()
        itemsScreen.checkScreen()
    }

    private func navigateToRedScreen() {
        mainScreen.checkScreen()
        mainScreen.goRedScreen()
        redScreen.checkScreen()
    }
    
    private func navigateToBlueScreen() {
        mainScreen.checkScreen()
        mainScreen.goBlueScreen()
        blueScreen.checkScreen()
    }

    private func navigateToGreenScreen() {
        mainScreen.checkScreen()
        mainScreen.goGreenScreen()
        greenScreen.checkScreen()
    }
    
    private func navigateToBlueScreenThrowGreenScreen() {
        mainScreen.checkScreen()
        mainScreen.goGreenScreen()
        greenScreen.checkScreen()
        greenScreen.goBlueScreen()
        blueScreen.checkScreen()
    }
}
