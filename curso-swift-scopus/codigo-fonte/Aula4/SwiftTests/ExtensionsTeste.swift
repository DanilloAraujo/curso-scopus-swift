//
//  ExtensionsTeste.swift
//  SwiftTests
//
//  Created by Danillo on 24/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for i in 0..<self.count {
            let random: Int = Int(arc4random_uniform(UInt32(self.count - 1)))
            self.swapAt(i, random)
        }
        
    }
}


extension String {
    
    enum  StringError: Error {
        case TesteException(UInt, UInt, Int)
    }
    
    func subString(p1: UInt, p2:UInt) -> String? {
        
        guard  p1 < self.count && p2 < self.count else { return nil }
        
        let d1 = String.IndexDistance(p1)
        let d2 = String.IndexDistance(p2)
        
        let i1 = self.index(self.startIndex, offsetBy: d1)
        let i2 = self.index(self.startIndex, offsetBy: d2)
        
        return String(self[i1..<i2])
    }
    
    func subString(pos p1: UInt, tam p2: UInt) -> String? {
        
        return self.subString(p1: p1, p2: p1+p2)
    }
    
    func subString(_ p1: UInt, _ p2:UInt) throws -> String {
        
        guard  p1 < self.count && p2 < self.count else {
         throw StringError.TesteException(p1, p2, self.count)
        }
        
        let d1 = String.IndexDistance(p1)
        let d2 = String.IndexDistance(p2)
        
        let i1 = self.index(self.startIndex, offsetBy: d1)
        let i2 = self.index(self.startIndex, offsetBy: d2)
        
        return String(self[i1..<i2])
    }
    
    static func subStringStatic(_ str: String, _ p1: UInt, _ p2: UInt ) -> String {
        
        let d1 = String.IndexDistance(p1)
        let d2 = String.IndexDistance(p2)
        
        let i1 = str.index(str.startIndex, offsetBy: d1)
        let i2 = str.index(str.startIndex, offsetBy: d2)
        
        return String(str[i1..<i2])
    }
}


class ExtensionsTeste: XCTestCase {
    
    func testeArray() {
        var nums = [1,2,3]
        print(nums)
        nums.shuffle()
        print(nums)
    }
    
    func testSubstringStatic() {
        XCTAssertEqual(String.subStringStatic("0123456", 2, 4), "23")
    }
    
    func testSubstring() {
        XCTAssertEqual("234", "012345".subString(pos: 2, tam: 3))
        XCTAssertEqual("234", "012345".subString(p1:2, p2:5))
        //XCTAssertEqual("234", "012345".subString(p1:15, p2:20))
    }
    
    func testException() {
        let str = "0123456"
        
        do {
            let _ :String =  try str.subString(2, 7)
        } catch String.StringError.TesteException(let p1, let p2, let count) {
            XCTFail("Range [\(p1), \(p2)] ⊄ [0, \(count)]")
        } catch {}
    }
}
