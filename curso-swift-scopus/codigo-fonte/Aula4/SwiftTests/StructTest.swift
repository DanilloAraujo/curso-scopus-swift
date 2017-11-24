//
//  SwiftTests.swift
//  SwiftTests
//
//  Created by Danillo on 24/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import XCTest

struct Movie {
    let director: String
    let title: String

    init() {
        self.director = "Diretor"
        self.title = "Filme"
    }

    init(director: String, title: String) {
        self.director = director
        self.title = title
    }

    init?(dictionary:[String:String]) {
        
        title = dictionary["title"] ?? "Title"
        director = dictionary["director"] ?? "Director"
        
        //if let title = dictionary["title"] {
        //    self.title = title
        //} else {
        //    return nil
        //}
        
        //if let director = dictionary["director"] {
        //    self.director = director
        //} else {
         //   return nil
        //}
    }
}

class  MovieC {
    var director: String
    var title: String
    
    convenience init() {
        self.init(director: "Director", title: "Title")
    }
    
    init( director: String, title: String) {
        self.title = title
        self.director = director
    }
    
}

typealias MovieS = Movie

class StructTest: XCTestCase {
    
    func testStruct() {
        let filme = Movie(director: "Dali", title: "Cangaceiro Trapalhao")
        XCTAssertEqual(filme.title, "Cangaceiro Trapalhao")
        
        guard Movie(dictionary:["title": "Lagoa Azul", "director": "Edigar"]) != nil else {
            XCTFail("Falhou ao criar o Movie")
            return
        }
    }
    
    func testStructVsClass() {
        let movieS = MovieS(director: "Jose", title: "Filme Qualquer")
        let movieC = MovieC(director: "TesteDirector", title: "Teste")
        
        func funcAlgumaCoisa(filme: Any) -> String? {
            
            if filme is MovieS {
                return (filme as! MovieS).title
            } else if filme is MovieC  {
                return (filme as! MovieC).title
            }
            
            return nil
        }
        
        print("MovieS: \(funcAlgumaCoisa(filme: movieS)!)")
        print("MovieC: \(funcAlgumaCoisa(filme: movieC)!)")
        
        //print("Title S: \(movieS.title) - Title C: \(movieC.title)")
    }
    
}
