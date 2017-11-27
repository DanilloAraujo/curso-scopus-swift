//
//  OverloadTest.swift
//  SwiftTests
//
//  Created by Danillo on 27/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

postfix operator -
infix operator ×

struct Vector2d {
    
    var x: Double
    var y: Double
    
    static func + (left: Vector2d, right: Vector2d) -> Vector2d {
        return Vector2d(x: (left.x + right.x), y: (left.x + right.x))
    }
    
    static func == (left: Vector2d, right: Vector2d) -> Bool {
        return left.x == right.x && left.y == right.y
    }
    
    static func != (left: Vector2d, right: Vector2d) -> Bool {
        return !(left.x == right.x)
    }
    
    static func += (left: inout Vector2d, right: Vector2d) {
        left = left + right
    }
    
    static prefix func - (right: Vector2d) -> Vector2d {
        return Vector2d(x: -right.x, y: -right.y)
    }
    
    static postfix func - (left: Vector2d) -> Vector2d {
        //return Vector2d(x: -left.x, y: -left.y)
        return -left
    }
    
    static func × (right: Vector2d, left: Vector2d) -> Double {
        return (left.x * right.x) + (left.y * right.y)
    }
}

extension Int {
    
    static postfix func ++ (left: inout Int) -> Int {
        let temp = left
        left = left + 1
        return temp
    }
    
    static prefix func ++ (left: inout Int) -> Int {
        left = left + 1
        return left
    }
}

class OverloadTest: XCTestCase {
   
    func testVectorSum() {
        var result = Vector2d(x: 2, y: 2) + Vector2d(x: 3, y: 3)
        XCTAssert(result == Vector2d(x: 5, y:5))
        XCTAssert(result != Vector2d(x: 6, y:5), "Not Equal")
        
        result += Vector2d(x: 3, y: 3)
        XCTAssert(result == Vector2d(x: 8, y:8))
        
        XCTAssert((Vector2d(x: 2, y: 2) × Vector2d(x: 2, y: 2)) == 8)
        
        
    }
    
    func testInt() {
        
        var i = 0
        XCTAssert(i++ == 0)
        XCTAssert(++i == 2)
        XCTAssert(3 * ++i == 9)
        XCTAssert(++i * 3 == 12)
    }
}
