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

/// Testing `Equatable`
extension LocationTests {

    /// Helper to refactor tests
    func assertLocationsAreNotEqualWith(firstLocationName: String, firstLocationCoordinates: (Double, Double)?, secondLocationName: String, secondLocationCoordinates: (Double, Double)?, line: UInt = #line) {
        var firstCoordinate: CLLocationCoordinate2D?
        if let firstLocation = firstLocationCoordinates {
            firstCoordinate = CLLocationCoordinate2D(latitude: firstLocation.0, longitude: firstLocation.1)
        }
        var secondCoordinate: CLLocationCoordinate2D?
        if let secondLocation = secondLocationCoordinates {
            secondCoordinate = CLLocationCoordinate2D(latitude: secondLocation.0, longitude: secondLocation.1)
        }

        let firstLocation = Location(name: firstLocationName, coordinate: firstCoordinate)
        let secondlocation = Location(name: secondLocationName, coordinate: secondCoordinate)
        XCTAssertNotEqual(firstLocation, secondlocation, line: line)
    }

    func test_isEqual_returnsFalseForUnequalNames() {
        assertLocationsAreNotEqualWith(firstLocationName: "A location", firstLocationCoordinates: nil, secondLocationName: "A second location", secondLocationCoordinates: nil)
    }

    func test_isEqual_returnsFalseForUnequalLatitudes() {
        //given
        let location = "A location"
        let equalLongitude: Double = 5
        //when/then
        assertLocationsAreNotEqualWith(firstLocationName: location, firstLocationCoordinates: (1, equalLongitude), secondLocationName: location, secondLocationCoordinates: (2, equalLongitude))
    }

    func test_isEqual_returnsFalseForUnequalLongitudes() {
        //given
        let location = "A location"
        let equalLatitude: Double = 5
        //when/then
        assertLocationsAreNotEqualWith(firstLocationName: location, firstLocationCoordinates: (equalLatitude, 3), secondLocationName: location, secondLocationCoordinates: (equalLatitude, 2))
    }

    func test_isEqual_returnsFalseForCompletelyUnequalLocations() {
        //given/when/then
        assertLocationsAreNotEqualWith(firstLocationName: "Some place", firstLocationCoordinates: (13, 6), secondLocationName: "Another place", secondLocationCoordinates: (9, 11))
    }

}
