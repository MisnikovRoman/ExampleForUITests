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
    private lazy var toDoZeroNumber = "0"
    private lazy var toDoZeroCell = app.staticTexts["Todo \(toDoZeroNumber)"]
    
    func checkScreen() {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0), "Can't find title")
        XCTAssertTrue(loadingText.waitForExistence(timeout: 1.0), "Loading didn't apear")
        XCTAssertTrue(toDoZeroCell.waitForExistence(timeout: 5.0), "Values in list didn't apear")
    }
    
    func checkAllComponents() {
        XCTAssertTrue(backButton.exists, "Can't find back button")
        checkAllCellsDisplaed()
    }
    
    func checkAllCellsDisplaed() {
        for number in 0...100 {
            let currentCell = self.findToDoCell(number: "\(number)")
            XCTAssertTrue(currentCell.exists, "ToDo \(number) in list didn't apear")
            if !currentCell.isHittable {
                app.swipeUp()
                XCTAssertTrue(currentCell.isHittable, "ToDo \(number) in list didn't visible on screen")
            }
        }
    }

    func goBack() {
        XCTAssertTrue(backButton.isHittable, "Back button isn't clicable")
        backButton.tap()
    }
    
    func findToDoCell(number: String) -> XCUIElement {
        return app.staticTexts["Todo \(number)"]
    }
}

