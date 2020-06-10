//
//  RedScreen.swift
//  ExampleUITests
//
//  Created by Sofya Simashkevich on 08.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class RedScreen {
    private let app = XCUIApplication()
    private lazy var title = app.navigationBars.staticTexts["Red"]
    private lazy var backButton = app.buttons["Main"]
    private lazy var titleLabel = app.staticTexts["Hello"]
    private lazy var bodyLabel = app.staticTexts["red_screen_body_label"]
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
    }
    
    func checkAllComponents() {
        XCTAssertTrue(backButton.exists, "Can't find back button")
        XCTAssertTrue(titleLabel.exists, "Can't find title text label")
        XCTAssertTrue(bodyLabel.exists, "Can't find body text label with id red_screen_body_label")
    }
    
    func goBack() {
        XCTAssertTrue(backButton.isHittable, "Back button isn't clicable")
        backButton.tap()
    }
}

