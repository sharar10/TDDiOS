//
//  ItemManager.swift
//  TDDiOS
//
//  Created by Sharar Arzuk Rahman on 2/25/19.
//  Copyright © 2019 Sharar Arzuk Rahman. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoItemCount: Int {
        return toDoItems.count
    }
    var doneItemCount: Int {
        return doneItems.count
    }
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []

    func addItem(_ toDoItem: ToDoItem) {
        guard toDoItems.contains(toDoItem) == false else {
            return
        }
        toDoItems.append(toDoItem)
    }

    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }

    func checkItem(at index: Int) {
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }

    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }

    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
