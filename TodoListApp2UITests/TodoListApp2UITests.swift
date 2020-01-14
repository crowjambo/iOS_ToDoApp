//
//  TodoListApp2UITests.swift
//  TodoListApp2UITests
//
//  Created by Evaldas on 1/7/20.
//  Copyright © 2020 Evaldas. All rights reserved.
//

import XCTest

class TodoListApp2UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	
	func test_adding_new_task(){
		let app = XCUIApplication()
		app.launch()
		
		let itemName = "some name"
		let itemDesc = "some description"

		app.navigationBars["TodoListApp2.View"].buttons["Add"].tap()
		
		let addNameTextField = app.textFields["Add Name"]
		addNameTextField.tap()
		addNameTextField.typeText(itemName)
		
		let addDescriptionTextField = app.textFields["Add Description"]
		addDescriptionTextField.tap()
		addDescriptionTextField.typeText(itemDesc)
		
		let addButton = app.buttons["Add"]
		addButton.tap()

		let newItem = app.tables.staticTexts[itemName]
		
		
		XCTAssertTrue(newItem.exists)
	}
	
	func test_removing_task(){
		
		let app = XCUIApplication()
		app.launch()
		
		// adding new item first
		let itemName = "some name"
		let itemDesc = "some description"

		app.navigationBars["TodoListApp2.View"].buttons["Add"].tap()
		
		let addNameTextField = app.textFields["Add Name"]
		addNameTextField.tap()
		addNameTextField.typeText(itemName)
		
		let addDescriptionTextField = app.textFields["Add Description"]
		addDescriptionTextField.tap()
		addDescriptionTextField.typeText(itemDesc)
		
		let addButton = app.buttons["Add"]
		addButton.tap()

		
		// removing with a swipe
		let newItem = app.tables.staticTexts[itemDesc]
		newItem.swipeLeft()
		app.tables/*@START_MENU_TOKEN@*/.buttons["trailing0"]/*[[".cells",".buttons[\"Delete\"]",".buttons[\"trailing0\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
		
		XCTAssertFalse(newItem.exists)
		
	}
	
	func test_editing_task(){
		let app = XCUIApplication()
		app.launch()
		
		// adding new item first
		let itemName = "some name"
		let itemDesc = "some description"

		app.navigationBars["TodoListApp2.View"].buttons["Add"].tap()
		
		let addNameTextField = app.textFields["Add Name"]
		addNameTextField.tap()
		addNameTextField.typeText(itemName)
		
		let addDescriptionTextField = app.textFields["Add Description"]
		addDescriptionTextField.tap()
		addDescriptionTextField.typeText(itemDesc)
		
		let addButton = app.buttons["Add"]
		addButton.tap()
		
		// editing
		let newItem = app.tables.staticTexts[itemDesc]
		newItem.tap()
		let newNameAddition = "1"
		let newDescAddition = "1"
		addNameTextField.tap()
		addNameTextField.typeText(newNameAddition)
		
		addDescriptionTextField.tap()
		addDescriptionTextField.typeText(newDescAddition)
		let updateButton = app.buttons["Update"]
		updateButton.tap()
		
		//final check
		let newName = itemName+newNameAddition
		let editedItem = app.tables.staticTexts[newName]
		XCTAssertTrue(editedItem.exists)
	}

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
