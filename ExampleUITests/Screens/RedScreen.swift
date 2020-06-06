//
//  RedScreen.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class RedScreen {

    private let app = XCUIApplication()

    // Components
    private lazy var title = app.navigationBars.staticTexts["Red"]
    private lazy var titleLabel = app.staticTexts["Hello"]
    private lazy var textBlock = app.staticTexts.element(boundBy: 2)
    private lazy var textBlockById = app.staticTexts["red_screen_body"]

    // Variables
    private let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    // Methods
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0))
    }

    func checkComponents() {
        XCTAssertTrue(titleLabel.exists)

        XCTAssertTrue(textBlock.exists)
        XCTAssertEqual(textBlock.label, text)

        XCTAssertTrue(textBlockById.exists)
        XCTAssertEqual(textBlockById.label, text)
    }
}
