//
//  Location.swift
//  TDDiOS
//
//  Created by Sharar Arzuk Rahman on 2/25/19.
//  Copyright © 2019 Sharar Arzuk Rahman. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?

    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
