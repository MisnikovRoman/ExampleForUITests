import XCTest

class BlueScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let navigate = Navigation()
    private let blueScreen = BlueScreen()
    private lazy var mainScreen = MainScreen()
    private lazy var greenScreen = GreenScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testBlueScreenThrowMainScreen() {
        navigate.go(to_distanation: .blue, throw_screen: .main)
        
        blueScreen.checkAllComponents(isFromMain: true)
    }
    
    func testBlueScreenThrowGreenScreen() {
        navigate.go(to_distanation: .blue, throw_screen: .green)
        
        blueScreen.checkAllComponents(isFromMain: false)
    }
    
    func testGoBackToMain() {
        navigate.go(to_distanation: .blue, throw_screen: .main)
        
        blueScreen.goBack()
        mainScreen.checkScreen()
    }
    
    func testGoBackToGreen() {
        navigate.go(to_distanation: .blue, throw_screen: .green)
        
        blueScreen.goBack()
        greenScreen.checkScreen()
    }
    
    func testChageAllSwitchStates() {
        navigate.go(to_distanation: .blue)
        
        blueScreen.checkAllSwitchesChangeAfterClick()
    }
    
    func testBlueScreenAfterChangedSwitchesGoToMainAndGoBack() {
        navigate.go(to_distanation: .blue, throw_screen: .main)
        
        blueScreen.checkAllSwitchesChangeAfterClick()
        
        blueScreen.goBack()
        mainScreen.checkScreen()
        mainScreen.goBlueScreen()
        blueScreen.checkScreen()
        blueScreen.checkAllComponents(isFromMain: true)
    }
}
