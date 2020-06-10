//
//  RedScreen.swift
//  ExampleUITests
//
//  Created by Sofya Simashkevich on 08.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class GreenScreen {
    private let app = XCUIApplication()
    private lazy var title = app.navigationBars.staticTexts["Green"]
    private lazy var backButton = app.buttons["Main"]
    private lazy var blueButton = app.buttons["Blue"]
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
    }
    
    func checkAllComponents() {
        XCTAssertTrue(blueButton.exists, "Can't find blue button")
        XCTAssertTrue(backButton.exists, "Can't find back button")
    }
    
    func goBack() {
        XCTAssertTrue(backButton.isHittable, "Back button isn't clicable")
        backButton.tap()
    }
    
    func goBlueScreen() {
        XCTAssertTrue(blueButton.isHittable, "Blue button isn't clicable")
        blueButton.tap()
    }
}

