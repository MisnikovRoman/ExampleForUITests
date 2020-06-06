//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Роман Мисников on 30.05.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class MainScreenUITests: XCTestCase {

    private let app = XCUIApplication()
    private let mainScreen = MainScreen()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testScreenComponents() throws {
        mainScreen.checkScreen()
        mainScreen.checkButtonsExists()
    }
}
