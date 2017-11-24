//
//  EnumTests.swift
//  SwiftTests
//
//  Created by Danillo on 24/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

enum Color: String {
    case Red = "Vermelho"
    case Blue = "Azul"
    case Green = "Verde"
    case Yellow = "Amarelo"
    case Unknow = "Desconhecido"
    
    var description: String {
        switch self {
        case .Red:
            return "Vermelho"
        case .Blue:
            return "Azul"
        case .Green:
            return "Verde"
        case.Yellow:
            return "Amarelo"
        default:
            return "Preto"
        }
    }
}

enum Result {
    case Success([String:String])
    case Fail(String)
}

class EnumTests: XCTestCase {
    
    func testColor() {
        XCTAssertEqual(Color.Blue.description, Color.Blue.rawValue)
    }
    
    func testEnum() {
        func validarRetorno(result: Result) {
            switch result {
            case .Success(let dic):
                XCTAssertNotNil(dic["Code"])
                print("Success")
            case .Fail(let str) where str.isEmpty:
                XCTAssertTrue(str.isEmpty)
                print("Falha Vazia")
            case .Fail(let str):
                XCTAssertNotNil(str)
                print("Falha")
            /*default:
                break*/
            }
        }
        
        let result1 = Result.Success(["Code":"200"])
        validarRetorno(result: result1)
        let result2 = Result.Fail("Error")
        validarRetorno(result: result2)
        let result3 = Result.Fail("")
        validarRetorno(result: result3)
    }
}
