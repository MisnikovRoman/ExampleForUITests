//
//  BlueScreen.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class GreenScreen {

    private let app = XCUIApplication()

    // Components
    private lazy var title = app.navigationBars.staticTexts["Green"]
    private lazy var button = app.staticTexts["Blue"]

    // Methods
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0))
    }

    func checkComponents() {
        XCTAssertTrue(button.exists)
    }

    func goToBlueScreen() {
        button.tap()
    }
}
