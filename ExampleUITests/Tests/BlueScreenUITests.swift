import XCTest

class BlueScreenUITests: Navigation {

    private let app = XCUIApplication()
    private let blueScreen = BlueScreen()
    private lazy var mainScreen = MainScreen()
    private lazy var greenScreen = GreenScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testBlueScreenThrowMainScreen() {
        super.NavigationToBlueScreen()
        
        blueScreen.checkAllComponentsThenGoFromMain()
    }
    
    func testBlueScreenThrowGreenScreen() {
        super.NavigationToBlueScreenThrowGreenScreen()
        
        blueScreen.checkAllComponentsThenGoFromGreen()
    }
    
    func testGoBackToMain() {
        super.NavigationToBlueScreen()
        
        blueScreen.goBack()
        mainScreen.checkScreen()
    }
    
    func testGoBackToGreen() {
        super.NavigationToBlueScreenThrowGreenScreen()
        
        blueScreen.goBack()
        greenScreen.checkScreen()
    }
    
    func testChageAllSwitchStates() {
        super.NavigationToBlueScreen()
        
        for number in 1...3 {
            let switchValueBeforeClick = blueScreen.getSwitchValue(switchNumber: number)
            blueScreen.clickToSwitch(switchNumber: number)
            let switchValueAfterClick = blueScreen.getSwitchValue(switchNumber: number)
        
            XCTAssertFalse(switchValueBeforeClick == switchValueAfterClick, "Swich \(number) didn't chage state after click")
            
        }
    }
    
    func testBlueScreenAfterChangedSwitchesGoToMainAndGoBack() {
        super.NavigationToBlueScreen()
        
        for number in 1...3 {
            let switchValueBeforeClick = blueScreen.getSwitchValue(switchNumber: number)
            blueScreen.clickToSwitch(switchNumber: number)
            let switchValueAfterClick = blueScreen.getSwitchValue(switchNumber: number)
        
            XCTAssertFalse(switchValueBeforeClick == switchValueAfterClick, "Swich \(number) didn't chage state after click")
            
        }
        
        blueScreen.goBack()
        mainScreen.checkScreen()
        mainScreen.goBlueScreen()
        blueScreen.checkScreen()
        blueScreen.checkAllComponentsThenGoFromMain()
    }
}
