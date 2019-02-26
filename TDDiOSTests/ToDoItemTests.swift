//
//  ToDoTests.swift
//  TDDiOSTests
//
//  Created by Sharar Arzuk Rahman on 2/25/19.
//  Copyright © 2019 Sharar Arzuk Rahman. All rights reserved.
//

import XCTest
@testable import TDDiOS

class ToDoItemTests: XCTestCase {

    func test_init_takesTitle() {
        //given/when
        let item = ToDoItem(title: "A title")
        //then
        XCTAssert(item.title == "A title")
    }

    func test_init_takesTitleAndDescription() {
        //given/when
        let item = ToDoItem(title: "A title", itemDescription: "A description")
        //then
        XCTAssert(item.title == "A title")
        XCTAssert(item.itemDescription == "A description")
    }

    func test_init_setsTimestamp() {
        //given/when
        let item = ToDoItem(title: "A title", timestamp: 0.0)
        //then
        XCTAssertEqual(item.timestamp, 0.0)
    }

    func test_init_setsLocation() {
        //given
        let location = Location(name: "Home")
        //when
        let toDoItem = ToDoItem(title: "A title", location: location)
        //then
        XCTAssertEqual(toDoItem.location?.name, "Home")
    }
}

extension ToDoItemTests {
    func test_isEqual_returnsTrueForEqualItems() {
        //given
        let item1 = ToDoItem(title: "A title", itemDescription: "A description", timestamp: 0, location: Location(name: "A location"))
        let item2 = ToDoItem(title: "A title", itemDescription: "A description", timestamp: 0, location: Location(name: "A location"))
        //when/then
        XCTAssertEqual(item1, item2)
    }

    func test_isEqual_returnsFalseForUnequalItems() {
        //given
        let item1 = ToDoItem(title: "A title", itemDescription: "A description", timestamp: 0, location: Location(name: "A location"))
        let item2 = ToDoItem(title: "A second title", itemDescription: "A description", timestamp: 0, location: Location(name: "A location"))
        //when/then
        XCTAssertNotEqual(item1, item2)
    }

    func test_isEqual_returnsFalseForUnequalTimestamps() {
        //given
        let title = "Hi"
        let itemDescription = "Description"
        let item1 = ToDoItem(title: title, itemDescription: itemDescription, timestamp: 1, location: nil)
        let item2 = ToDoItem(title: title, itemDescription: itemDescription, timestamp: 4, location: nil)
        XCTAssertNotEqual(item1, item2)
    }
}
