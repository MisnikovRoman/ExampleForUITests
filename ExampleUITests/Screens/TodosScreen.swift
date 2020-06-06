//
//  BlueScreen.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class TodosScreen {

    private let app = XCUIApplication()

    // Components
    private lazy var title = app.navigationBars.staticTexts["Todos"]
    private lazy var firstCell = cell(withName: "Todo 0")
    private lazy var lastCell = cell(withName: "Todo 100")
    private lazy var cells: [XCUIElement] = []

    // Methods
    @discardableResult
    func checkScreen() -> Self {
        XCTAssertTrue(title.waitForExistence(timeout: 1.0))
        return self
    }

    @discardableResult
    func waitForLoading() -> Self {
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5.0))
        return self
    }

    @discardableResult
    func checkIsLoading() -> Self {

        return self
    }

    @discardableResult
    func checkFirstCell() -> Self {
        XCTAssertTrue(firstCell.exists)
        XCTAssertTrue(firstCell.isHittable)
        return self
    }

    @discardableResult
    func checkLastCell() -> Self {
        XCTAssertTrue(lastCell.exists)
        XCTAssertTrue(lastCell.isHittable)
        return self
    }

    @discardableResult
    func swipeToBottom() -> Self {

        for _ in 0..<10 {
            if lastCell.isHittable {
                return self
            }
            app.swipeUp()
        }
        XCTFail()

        return self
    }
}

private extension TodosScreen {
    var visibleCells: [XCUIElement] {
        cells.filter { $0.isHittable }
    }

    func cell(withName name: String) -> XCUIElement {
        app.tables.firstMatch.staticTexts[name]
    }

    func getAllCells() {
        var cells: [XCUIElement] = []
        for i in 0..<app.tables.firstMatch.cells.count {
            let cell = app.tables.firstMatch.cells.element(boundBy: i)
            cells.append(cell)
        }
        print("⚠️ Loaded \(cells.count) cells")
        self.cells = cells
    }
}
