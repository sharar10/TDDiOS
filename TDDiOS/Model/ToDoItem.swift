//
//  ToDoItem.swift
//  TDDiOS
//
//  Created by Sharar Arzuk Rahman on 2/25/19.
//  Copyright © 2019 Sharar Arzuk Rahman. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?

    init(title: String, itemDescription: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }

}
