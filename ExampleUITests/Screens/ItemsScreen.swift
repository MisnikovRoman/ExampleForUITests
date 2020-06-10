//
//  RedScreen.swift
//  ExampleUITests
//
//  Created by Sofya Simashkevich on 08.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class ItemsScreen {
    private let app = XCUIApplication()
    private lazy var title = app.navigationBars.staticTexts["Todos"]
    private lazy var backButton = app.buttons["Main"]
    private lazy var loadingText = app.staticTexts["Loading"]
    private lazy var toDoCell = app.staticTexts["Todo 0"]
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
        XCTAssertTrue(loadingText.waitForExistence(timeout: 1.0), "Loading didn't apear")
        XCTAssertTrue(toDoCell.waitForExistence(timeout: 1.0), "Values in list didn't apear")
    }
    
    func checkAllComponents() {
        XCTAssertTrue(backButton.exists, "Can't find back button")
    }
    
    func goBack() {
        XCTAssertTrue(backButton.isHittable, "Back button isn't clicable")
        backButton.tap()
    }
}

