//
//  ProtocolTest.swift
//  SwiftTests
//
//  Created by Danillo on 27/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

protocol Geometry {
    static var corners: Double {get}
    
    var x: Double {get set}
    
    var y: Double {get set}
    
    func area() -> Double
    
    mutating func translate(_ dx: Double, _ dy: Double)
    
    static func new (from point: CGPoint) -> Geometry

}

class Rect : Geometry{
    
    static var corners: Double {
        return 4
    }
    
    static func new(from point: CGPoint) -> Geometry {
        return Rect(Double(point.x), Double(point.y))
    }
    
    var x: Double
    
    var y: Double
    
    var width: Double
    
    var height: Double
    
    init(_ x: Double, _ y: Double, _ width: Double, _ height: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    convenience init (_ x: Double, _ y: Double) {
        self.init(x, y, 1, 1)
    }
    
    func area() -> Double {
        return width * height
    }
    
    func translate(_ dx: Double, _ dy: Double) {
        x += dx
        y += dy
    }
    
}

struct Circle : Geometry {
    
    static var corners: Double {
        return Double.infinity
    }
    
    var radius: Double
    
    var x: Double
    
    var y: Double
    
    func area() -> Double {
        return pow(radius, 2) * Double.pi
    }
    
    mutating func translate(_ dx: Double, _ dy: Double) {
        x += dx
        y += dy
    }
    
    static func new(from point: CGPoint) -> Geometry {
        return Circle(radius: 1, x: Double(point.x), y: Double(point.y))
    }
    
    
}

extension CGPoint : Geometry {
    static var corners: Double {
        return 0
    }
    
    var x: Double {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }
    
    var y: Double {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    func area() -> Double {
        return Double.nan
    }
    
    mutating func translate(_ dx: Double, _ dy: Double) {
        self.x += dx
        self.y += dy
    }
    
    static func new(from point: CGPoint) -> Geometry {
        return point
    }
    
    
}

class ProtocolTest : XCTest {
    
    func testInstance() {
        let rect  = Rect(10, 20, 10, 10)
        let circle = Circle(radius: 10, x: 2, y: 9)
        XCTAssertEqual(rect.area(), 100)
        XCTAssertEqual(circle.area(), 100 * Double.pi)
        //XCTAssert(circle is Geometry && rect is Geometry)
        
    }
}

