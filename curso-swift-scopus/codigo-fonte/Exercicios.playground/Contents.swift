//: Playground - noun: a place where people can play

import UIKit

// Last Index
/*class List<T> {
    
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
            //print(current.value)
            current = next
        }
        //print("Resultado: \(current.value)")
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
    
    func length() -> Int {
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

List(1,2,3,4,5,6,8,9).length()*/

class LLNode{
    var key:Int!
    var nextNode:LLNode!
}

class LinkedList {
    
    var Head:LLNode!
    func insert(key:Int){
        
        if(Head == nil){
            Head = LLNode()
            Head.key = key
            Head.nextNode = nil
        }
        else{
            var current:LLNode! = Head
            while(current.nextNode != nil){
                current = current.nextNode
            }
            
            current.nextNode = LLNode()
            current.nextNode.key = key
            current.nextNode.nextNode = nil
        }
    }
}

extension LinkedList{
    var last:Int{
        var current:LLNode! = Head
        while(current.nextNode != nil){
            current = current.nextNode
        }
        return current.key
    }
}

extension LinkedList{
    var pennultimate:Int{
        var current:LLNode! = Head
        while(current.nextNode.nextNode != nil){
            current = current.nextNode
        }
        return current.key
    }
}

extension LinkedList{
    subscript(Index:Int)->Int{
        var current:LLNode! = Head
        var counter = 0
        while(counter != Index && current.nextNode != nil){
            counter+=1
            current = current.nextNode
        }
        return current.key
    }
}

extension LinkedList{
    var length:Int{
        var current:LLNode! = Head
        var counter = 0
        while(current != nil){
            counter+=1
            current = current.nextNode
        }
        return counter
    }
}

extension LinkedList{
    func reverse(){
        var current2ndElement:LLNode! = Head
        var current1stElement:LLNode! = Head.nextNode
        current2ndElement.nextNode = nil
        var temp:LLNode!
        while(current1stElement != nil){
            temp = current1stElement.nextNode
            current1stElement.nextNode = current2ndElement
            current2ndElement = current1stElement
            current1stElement = temp
        }
        Head = current2ndElement
    }
}

extension LinkedList{
    func isPalindrome()->Bool{
        var low = 0
        var high = self.length-1
        while(low <= high){
            if(self[low] != self[high]){
                return false
            }
            low+=1
            high-=1
        }
        return true
    }
}

let list = LinkedList()
list.insert(key: 1)
list.insert(key: 2)
list.insert(key: 3)
list.insert(key: 4)
list.last
list.pennultimate
list.length
list.reverse()
list.last
list.pennultimate

let palindrome = LinkedList()
palindrome.insert(key: 1)
palindrome.insert(key: 2)
palindrome.insert(key: 3)
palindrome.insert(key: 2)
palindrome.insert(key: 1)
palindrome.isPalindrome()


public class List<T> {
    var value: T!
    var nextItem: List<T>?
    
    public convenience init!(_ values: T...) {
        self.init(Array(values))
    }
    
    init!( _ values: Array<T>) {
        var values = values
        if values.count == 0 {
            return nil
        }
        value = values.removeFirst()
        nextItem = List(values)
    }
}









