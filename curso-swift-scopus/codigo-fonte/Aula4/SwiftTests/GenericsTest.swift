//
//  GenericsTest.swift
//  SwiftTests
//
//  Created by Danillo on 27/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

class Stack<T> {
    
    var itens = Array<T>()
    
    var peek: T? {
        return itens.last
    }
    
    init(_ itens:Array<T>) {
        self.itens = itens
    }
    
    func push(_ item: T) {
        itens.append(item)
    }
    
    func pop() -> T? {
        guard itens.isEmpty else {
            return nil
            
        }
        return itens.removeLast()
    }
}

class GenericsTest: XCTestCase {
    
    func testGenericUsage() {
        
        let _ = [Int]()
        let _ = Array<Int>()
        let _ = [Int:Int]()
        let _ = Dictionary<Int,Int>()
        let _ :Int?
        let _ :Optional<Int>
        
    }
    
    func testStack() {
        
        let stack = Stack([1,2,3])
        stack.push(4)
        XCTAssertEqual(4, stack.itens.count)
        //XCTAssertEqual(4, stack.pop())
        XCTAssertEqual(4, stack.peek)
    }
}
