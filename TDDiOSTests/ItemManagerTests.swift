//
//  ItemManagerTests.swift
//  TDDiOSTests
//
//  Created by Sharar Arzuk Rahman on 2/25/19.
//  Copyright © 2019 Sharar Arzuk Rahman. All rights reserved.
//

import XCTest
@testable import TDDiOS

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!

    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_toDoItemCount_isInitiallyZero() {
        //given/when/then
        XCTAssertEqual(sut.toDoItemCount, 0)
    }

    func test_doneItemCount_isInitiallyZero() {
        //given/when/then
        XCTAssertEqual(sut.doneItemCount, 0)
    }

    func test_addItem_changesCountToOne() {
        //given/when
        sut.addItem(ToDoItem(title: "An item"))
        //then
        XCTAssertEqual(sut.toDoItemCount, 1)
    }

    func test_addItem_doesNotAddNonUniqueItem() {
        //given/when
        sut.addItem(ToDoItem(title: "An item"))
        sut.addItem(ToDoItem(title: "An item"))
        //then
        XCTAssertEqual(sut.toDoItemCount, 1)
    }

    func test_getItem_returnsAddedItem() {
        //given
        let item = ToDoItem(title: "A title")
        //when
        sut.addItem(item)
        let returnedItem = sut.item(at: 0)
        //then
        XCTAssertEqual(item.title, returnedItem.title)
    }

    func test_checkItem_changesDoneCountAndTodoCount() {
        //given
        let item = ToDoItem(title: "A title")
        sut.addItem(item)
        //when
        sut.checkItem(at: 0)
        //then
        XCTAssertEqual(sut.doneItemCount, 1)
        XCTAssertEqual(sut.toDoItemCount, 0)
    }

    func test_checkItem_removesItemFromTodos() {
        //given
        let first = ToDoItem(title: "A title")
        let second = ToDoItem(title: "A second title")
        sut.addItem(first)
        sut.addItem(second)
        //when
        sut.checkItem(at: 0)
        //then
        XCTAssertEqual(sut.item(at: 0).title, second.title)
    }

    func test_doneItem_returnsRightItem() {
        //given
        let first = ToDoItem(title: "A title")
        sut.addItem(first)
        sut.checkItem(at: 0)
        //when
        let item = sut.doneItem(at: 0)
        //then
        XCTAssertEqual(item.title, first.title)
    }

    func test_removeAll_resultsInCountsToBeZero() {
        //given
        sut.addItem(ToDoItem(title: "One"))
        sut.addItem(ToDoItem(title: "Two"))
        sut.checkItem(at: 0)
        XCTAssertEqual(sut.doneItemCount, 1)
        XCTAssertEqual(sut.toDoItemCount, 1)
        //when
        sut.removeAll()
        //then
        XCTAssertEqual(sut.doneItemCount, 0)
        XCTAssertEqual(sut.toDoItemCount, 0)
    }
}
