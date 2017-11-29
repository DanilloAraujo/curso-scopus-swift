//
//  HiScore.swift
//  DynamicPrototypes
//
//  Created by Danillo on 29/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import Foundation

class Hi💧Score {
    
    var name: String
    var rating: String
    
   //convenience init() {
        //self.init(name: "", rating: "0")
    //}
    
    init(name: String, rating: String) {
        self.name = name
        self.rating = rating
    }
    
    static func generatorInstance(numberInstances: Int) -> [Hi💧Score] {
        
        var instance = [Hi💧Score]()
        
        for i in 0..<numberInstances {
            instance.append(Hi💧Score.init(name: "Nome - 1", rating: "Rating - \(i * 100)" ))
        }
        
        return instance
    }
}
