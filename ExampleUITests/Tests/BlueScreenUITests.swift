//
//  BlueScreenUITests.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class BlueScreenUITests: XCTestCase {

    private var app = XCUIApplication()
    private let mainScreen = MainScreen()
    private let blueScreen = BlueScreen()
    private let greenScreen = GreenScreen()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testScreenComponents() throws {
        // path to screen
        mainScreen.goBlueScreen()
        // checks
        blueScreen.checkScreen()
        blueScreen.checkComponents()
        blueScreen.checkSwitchesState()
    }

    func testScreenRouteViaGreenScreen() throws {
        mainScreen.checkScreen()
        mainScreen.goGreenScreen()

        greenScreen.checkScreen()
        greenScreen.goToBlueScreen()

        blueScreen.checkScreen()
        blueScreen.checkComponents()
    }

    func testTogglesSwitches() throws {
        mainScreen.goBlueScreen()
        blueScreen.toogle(blueScreen.switch1)
        blueScreen.toogle(blueScreen.switch2)
        blueScreen.toogle(blueScreen.switch3)
    }
}
