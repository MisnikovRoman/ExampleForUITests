//
//  RedScreen.swift
//  ExampleUITests
//
//  Created by Sofya Simashkevich on 08.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class BlueScreen {
    private let app = XCUIApplication()
    private lazy var title = app.navigationBars.staticTexts["Blue"]
    private lazy var backButtonToMain = app.buttons["Main"]
    private lazy var backButtonToGreen = app.buttons["Green"]
    private lazy var switchButtonIdTPL = "blue_screen_switch_%number%"
    private lazy var switchLabelNameTPL = "Switch %number%"
    
    private lazy var switchesButtonIsOnDefaultValues = [true, false, true]
    
 
    private func findSwitchButton(number: String) -> XCUIElement {
        return app.switches["\(switchButtonIdTPL.replacingOccurrences(of: "%number%", with: "\(number)"))"]
    }
    
    private func findSwitchLabel(number: String) -> XCUIElement {
        return app.staticTexts["\(switchLabelNameTPL.replacingOccurrences(of: "%number%", with: "\(number)"))"]
    }
    
    private func getSwitch(switchName: SwitchesOnBlueScreen) -> XCUIElement {
        switch switchName {
        case .switch_1:
            return self.findSwitchButton(number: "1")
        case .switch_2:
            return self.findSwitchButton(number: "2")
        case .switch_3:
            return self.findSwitchButton(number: "3")
        }
    }
    
    private func getSwitchLabel(switchName: SwitchesOnBlueScreen) -> XCUIElement {
        switch switchName {
        case .switch_1:
            return self.findSwitchLabel(number: "1")
        case .switch_2:
            return self.findSwitchLabel(number: "2")
        case .switch_3:
            return self.findSwitchLabel(number: "3")
        }
    }
    
    private func getSwitchIsOnDefaultState(switchName: SwitchesOnBlueScreen) -> Bool {
        switch switchName {
        case .switch_1:
            return switchesButtonIsOnDefaultValues[0]
        case .switch_2:
            return switchesButtonIsOnDefaultValues[1]
        case .switch_3:
            return switchesButtonIsOnDefaultValues[2]
        }
    }
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
    }
    
    private func checkSwitchAndItsLabel(switchName: SwitchesOnBlueScreen) {
            XCTAssertTrue(self.getSwitchLabel(switchName: switchName).exists, "Can't find switch '\(switchName)' label")
            XCTAssertTrue(self.getSwitch(switchName: switchName).exists, "Can't find switch '\(switchName)' button")
        XCTAssertTrue(self.isSwitchOn(switchName: switchName) == self.getSwitchIsOnDefaultState(switchName: switchName), "Switch '\(switchName)' in incorrect value")
    }
    
    func checkAllComponents(isFromMain: Bool) {
      if isFromMain {
        XCTAssertTrue(backButtonToMain.exists, "Can't find back button")
        for switchName in SwitchesOnBlueScreen.allCases { self.checkSwitchAndItsLabel(switchName: switchName)
        }

      } else {
        XCTAssertTrue(backButtonToGreen.exists, "Can't find back button")
        for switchName in SwitchesOnBlueScreen.allCases { self.checkSwitchAndItsLabel(switchName: switchName)
        }
      }
    }
    
    func goBack() {
        let backButton: XCUIElement
        if backButtonToMain.exists {
            backButton = backButtonToMain
        } else if backButtonToGreen.exists{
            backButton = backButtonToGreen
        } else {
            XCTFail("Can't find back button")
            return
        }
        
        XCTAssertTrue(backButton.isHittable, "Back button isn't clicable")
        backButton.tap()
    }

    
    func clickToSwitch(switchName: SwitchesOnBlueScreen) {
        let switchButton = self.getSwitch(switchName: switchName)
        XCTAssertTrue(switchButton.isHittable, "Switch '\(switchName)' isn't clicable")
        switchButton.tap()
    
    }
    
    func isSwitchOn(switchName: SwitchesOnBlueScreen) -> Bool? {
        let switchButton = self.getSwitch(switchName: switchName)
        
        guard let switchValue = switchButton.value as? String else { return nil }
        
        if switchValue == "0" {
            return false
        } else if switchValue == "1" {
            return true
        } else {
            XCTFail("Can't convert switch value to bool 'is swich on' param")
            return nil
        }
    }
    
    func checkAllSwitchesChangeAfterClick() {
        for switchName in SwitchesOnBlueScreen.allCases {
            let switchValueBeforeClick = self.isSwitchOn(switchName: switchName)
            self.clickToSwitch(switchName: switchName)
            let switchValueAfterClick = self.isSwitchOn(switchName: switchName)
            
            XCTAssertFalse(switchValueBeforeClick == switchValueAfterClick, "Swich '\(switchName)' didn't chage state after click")
            
        }
    }
}

