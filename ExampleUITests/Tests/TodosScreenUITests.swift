//
//  BlueScreenUITests.swift
//  ExampleUITests
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import XCTest

class TodosScreenUITests: XCTestCase {

    private var app = XCUIApplication()
    private let mainScreen = MainScreen()
    private let todosScreen = TodosScreen()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testScreenComponents() throws {
        mainScreen
            .goTodosScreen()
        todosScreen
            .checkScreen()
            .checkIsLoading()
    }

    func testCells() throws {
        mainScreen
            .goTodosScreen()
        todosScreen
            .checkScreen()
            .waitForLoading()
            .checkFirstCell()
            .swipeToBottom()
            .checkLastCell()
    }
}
