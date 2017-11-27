//
//  CuriousityTests.swift
//  SwiftTests
//
//  Created by Danillo on 27/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

class PropertyObserves {
    var test = 0
    var value = 0 {
        willSet {
            print("Setou + 1 no willSet")
            test += 1
        }
        didSet {
            print("Setou + 2 no didSet")
            test += 2
        }
    }
}

class CuriousityTests: XCTestCase {
    
    func testFloat() {
        var count = 0
        for _ in stride(from: 0.5, through: 2.5, by: 0.5){
            count += 1
        }
        
        XCTAssertEqual(count, 5)
    }
    
    func testProperty() {
        let v  = PropertyObserves()
        v.value = 1
        XCTAssertEqual(v.test, 3)
    }
    
}
