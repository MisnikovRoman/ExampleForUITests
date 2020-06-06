//
//  MainScreen.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class MainScreen {
    private let app = XCUIApplication()

    private lazy var title = app.navigationBars.staticTexts["Main"]
    private lazy var listButton = app.navigationBars.buttons["Items"]
    private lazy var redButton = app.buttons["Red"]
    private lazy var blueButton = app.buttons["Blue"]
    private lazy var greenButton = app.buttons["Green"]

    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0))
    }

    func checkButtonsExists() {
        XCTAssertTrue(listButton.exists)
        XCTAssertTrue(redButton.exists)
        XCTAssertTrue(blueButton.exists)
        XCTAssertTrue(greenButton.exists)
    }

    func goRedScreen() {
        redButton.tap()
    }

    func goBlueScreen() {
        blueButton.tap()
    }

    func goGreenScreen() {
        greenButton.tap()
    }
}
