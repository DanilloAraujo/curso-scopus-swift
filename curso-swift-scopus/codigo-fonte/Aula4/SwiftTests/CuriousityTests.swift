//
//  CuriousityTests.swift
//  SwiftTests
//
//  Created by Danillo on 27/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

class ClasseLegal {
    
    private var value = 1
    
    subscript (index: Int) -> Int {
        get {
            return value * index;
        }
        set {
            value = newValue
        }
    }
    
    subscript (indexs: Int...) -> Int {
        var prod = value
        for v in indexs {
            prod *= v
        }
        return prod
    }
    
    subscript (key: String, value: Int) -> Int {
        return (Int(key) ?? 1) * self.value * value
    }
}

class PropertyObserves {
    
    init() {
        print("Inicializado \(PropertyObserves.instanceCount)")
        PropertyObserves.instanceCount += 1
    }
    
    static var instanceCount = 0
    
    lazy var instance = PropertyObserves()
    
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
    
    func testLazyInstanciate() {
        let v = PropertyObserves()
        print(v.instance)
    }
    
    func testOperatorAsFunction() {
        func arithimetic(v1: Double, v2: Double, op: ((Double, Double) -> Double)) -> Double {
            return op(v1, v2)
        }
        
        XCTAssertEqual(4, arithimetic(v1: 2, v2: 2, op: +))
        print(arithimetic(v1: 2, v2: 2, op: +))
        XCTAssertEqual(4, arithimetic(v1: 6, v2: 2, op: -))
        print(arithimetic(v1: 6, v2: 2, op: +))
        XCTAssertEqual(12, arithimetic(v1: 6, v2: 2, op: *))
        print(arithimetic(v1: 6, v2: 2, op: *))
        XCTAssertEqual(3, arithimetic(v1: 6, v2: 2, op: /))
        print(arithimetic(v1: 6, v2: 2, op: /))
    }
    
    func testSubscript() {
        
        XCTAssertEqual(4, ClasseLegal()[4])
        XCTAssertEqual(256, ClasseLegal()[2,2,2,2,2,2,2,2])
        XCTAssertEqual(4, ClasseLegal()["2",2])
    }
    
}
