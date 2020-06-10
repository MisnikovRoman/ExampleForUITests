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
    
    private lazy var switch1Label = app.staticTexts["Switch 1"]
    private lazy var switch1Button = app.switches["blue_screen_switch_1"]
    private lazy var switch1ButtonDefaultValue = "1"
    
    private lazy var switch2Label = app.staticTexts["Switch 2"]
    private lazy var switch2Button = app.switches["blue_screen_switch_2"]
    private lazy var switch2ButtonDefaultValue = "0"
    
    private lazy var switch3Label = app.staticTexts["Switch 3"]
    private lazy var switch3Button = app.switches["blue_screen_switch_3"]
    private lazy var switch3ButtonDefaultValue = "1"
    
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
    }
    
    private func checkAllComponentsExcludeBackButton() {
        XCTAssertTrue(switch1Label.exists, "Can't find switch 1 label")
        XCTAssertTrue(switch1Button.exists, "Can't find switch 1 button")
        XCTAssertTrue(self.getSwitchValue(switchNumber: 1) == switch1ButtonDefaultValue, "Switch 1 in incorrect value")
        
        XCTAssertTrue(switch2Label.exists, "Can't find switch 2 label")
        XCTAssertTrue(switch2Button.exists, "Can't find switch 2 button")
        XCTAssertTrue(self.getSwitchValue(switchNumber: 2) == switch2ButtonDefaultValue, "Switch 2 in incorrect value")
        
        XCTAssertTrue(switch3Label.exists, "Can't find switch 3 label")
        XCTAssertTrue(switch3Button.exists, "Can't find switch 3 button")
        XCTAssertTrue(self.getSwitchValue(switchNumber: 3) == switch3ButtonDefaultValue, "Switch 3 in incorrect value")
    }
    
    func checkAllComponentsThenGoFromMain() {
        XCTAssertTrue(backButtonToMain.exists, "Can't find back button")
        self.checkAllComponentsExcludeBackButton()
    }
    
    func checkAllComponentsThenGoFromGreen() {
        XCTAssertTrue(backButtonToGreen.exists, "Can't find back button")
        self.checkAllComponentsExcludeBackButton()
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
    
    private func defineSwitchByNumber(switchNumber: Int) -> XCUIElement {
        switch switchNumber {
        case 1:
            return switch1Button
        case 2:
            return switch2Button
        case 3:
            return switch3Button
        default:
            fatalError("Unexpected value of switch number")
        }
    }
    
    func clickToSwitch(switchNumber: Int) {
        let switchButton = defineSwitchByNumber(switchNumber: switchNumber)
        
        XCTAssertTrue(switchButton.isHittable, "Switch \(switchNumber) isn't clicable")
        switchButton.tap()
    }
    
    func getSwitchValue(switchNumber: Int) -> String {
        let switchButton = defineSwitchByNumber(switchNumber: switchNumber)
        
        return switchButton.value as! String
    }
}

