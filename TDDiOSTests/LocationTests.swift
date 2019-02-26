//
//  LocationTests.swift
//  TDDiOSTests
//
//  Created by Sharar Arzuk Rahman on 2/25/19.
//  Copyright © 2019 Sharar Arzuk Rahman. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TDDiOS

class LocationTests: XCTestCase {

    func test_init_setsName() {
        //given
        let name = "Home"
        //when
        let location = Location(name: name)
        //then
        XCTAssertEqual(location.name, "Home")
    }

    func test_init_setsCoordinate() {
        //given
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        //when
        let location = Location(name: "A location", coordinate: coordinate)
        //then
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
}
