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
