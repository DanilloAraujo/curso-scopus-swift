//
//  MemoryTests.swift
//  SwiftTests
//
//  Created by Danillo on 28/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

class A {
    
    var refB: B? = nil
    var refC: C? = nil
    
    deinit {
        print("A morreu ☠️")
    }
}

class B {
    
    weak var refA: A? = nil
    
    deinit {
        print("B morreu ☠️")
    }
}

class C {
    
    unowned var refA: A = A()
    
    deinit {
        print("C morreu ☠️")
    }
}

class MemoryTest: XCTestCase {
    
    func testARC() {
        /*
        var v1: A? = A()
        var v2: A? = v1
        var v3: A? = v1
        
        v1 = nil
        v2 = nil
        v3 = nil
         */
    }
    
    func testDeallocation() {
        var a: A? = A()
        var b: B? = B()
        
        a?.refB = b
        b?.refA = a
        
        a = nil
        b = nil
    }
}
