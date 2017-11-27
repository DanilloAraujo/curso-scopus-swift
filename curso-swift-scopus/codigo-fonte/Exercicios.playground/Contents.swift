//: Playground - noun: a place where people can play

import UIKit

 // Last Index
class List<T> {
    
    var value: T!
    var next: List<T>?
    
    public convenience init!(_ values: T...) {
        self.init(Array(values))
    }
    
    init!(_ values: Array<T>) {
        
        var values = values
        print(values)
        
        if values.count == 0 {
            return nil
        }
        
        value = values.removeFirst()
        next = List(values)
    }
    
}

extension List {
    func ultimo() -> T {
        var current = self
        while let next = current.next {
            print(current.value)
            current = next
        }
        print("Resultado: \(current.value)")
        return current.value
    }
    func penultimo() -> T {
        var current = self
        while(current.next?.next != nil){
            current = current.next!
        }
        return current.value
    }
    
    /*subscript(Index:Int) -> T {
        var current = self
        var counter = 0
        while(counter != Index && current.next != nil){
            counter += 1
            current = current.next!
        }
        return current.value
    }*/
    
    func length() -> Int{
        var current = self
        var counter = 0
        while(current.next != nil){
            counter += 1
            current = current.next!
        }
        return counter
    }
    
    
}

List(1,2,3,4,5,6,8,9).ultimo()

List(1,2,3,4,5,6,8,9,6,3,8).penultimo()

List(1,2,3,4,5,6,8,9).length()



