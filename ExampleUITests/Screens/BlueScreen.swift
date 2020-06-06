//
//  BlueScreen.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class BlueScreen {

    private let app = XCUIApplication()

    // Components
    private lazy var title = app.navigationBars.staticTexts["Blue"]
    private lazy var label1 = app.staticTexts["Switch 1"]
    private lazy var label2 = app.staticTexts["Switch 2"]
    private lazy var label3 = app.staticTexts["Switch 3"]

    lazy var switch1 = app.switches["blue_screen_switch1"]
    lazy var switch2 = app.switches["blue_screen_switch2"]
    lazy var switch3 = app.switches["blue_screen_switch3"]

    // Methods
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0))
    }

    func checkComponents() {
        XCTAssertTrue(label1.exists)
        XCTAssertTrue(label2.exists)
        XCTAssertTrue(label3.exists)

        XCTAssertTrue(switch1.exists)
        XCTAssertTrue(switch2.exists)
        XCTAssertTrue(switch3.exists)
    }

    func checkSwitchesState() {
        XCTAssertTrue(switch1.isOn)
        XCTAssertFalse(switch2.isOn)
        XCTAssertTrue(switch3.isOn)
    }

    func toogle(_ switchElement: XCUIElement) {
        let isExpectedStateOn = switchElement.isOn
        switchElement.tap()
        XCTAssertNotEqual(isExpectedStateOn, switchElement.isOn)
    }
}

private extension XCUIElement {
    var isOn: Bool {
        switch value as? String {
        case "0":
            return false
        case "1":
            return true
        default:
            XCTFail()
            return false
        }
    }
}
