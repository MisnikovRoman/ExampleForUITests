//
//  RedScreenUITests.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class RedScreenUITests: XCTestCase {

    private var app = XCUIApplication()
    private let mainScreen = MainScreen()
    private let redScreen = RedScreen()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testScreenComponents() throws {
        // path to screen
        mainScreen.goRedScreen()
        // checks
        redScreen.checkScreen()
        redScreen.checkComponents()
    }
}
