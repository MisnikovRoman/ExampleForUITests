//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Роман Мисников on 30.05.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class MainScreenUITests: XCTestCase {

    private var app = XCUIApplication()

    private lazy var title = app.navigationBars.staticTexts["Main"]
    private lazy var listButton = app.navigationBars.buttons["Items"]
    private lazy var redButton = app.buttons["Red"]
    private lazy var blueButton = app.buttons["Blue"]
    private lazy var greenButton = app.buttons["Green"]

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testScreenComponents() throws {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0))
        XCTAssertTrue(listButton.exists)
        XCTAssertTrue(redButton.exists)
        XCTAssertTrue(blueButton.exists)
        XCTAssertTrue(greenButton.exists)
    }
}
