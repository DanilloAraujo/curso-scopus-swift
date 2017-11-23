//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var inteiro = 2
inteiro += 10
let `let` = 4; print(`let`)

let teste: String
teste = "456"
teste + "123"

let nome: String? = "oi"
nome!.description + "teste"

let teste1: Int? = 1
let teste2: Int = teste1!


let str2 = """
teste
teste
teste
"""

let sum = "2 + 2 =\(str2)"

//Array
let array:[Float] = []
let array2 = [Int]()
let array3 = [1,2,3]
let array4 = [5,6,7,8,9]
array3 + array4
array3[0]
array3[1]
array3[2]

let variavel: Int = Int.max




//Tupla
var myTuple = (0,var1: 0,"2")
let (a, d, c) = myTuple

a == myTuple.0
d == myTuple.var1
c



//Dictionary
//var nameOfEmail = [String:String]()

var nameOfEmail : [String:String] = [:]

nameOfEmail["Danillo Araujo Silva"] = "danilloaraujo.si@gmail.com"
nameOfEmail["Danillo Araujo Silva"]

let emailOfName = [
    "Danillo Araujo Silva : danilloaraujo.si@gmail.com"
]



let m1, m2, m3 : Int

let i💜Swift = false


/**
 comentario
 
     /**
        dentro de outro comentario
     **/
 
 **/

typealias int = Int // define uma alias para um tipo

let outro = 1.25e-2

let oneMilion = 10_000_000_000_000
1000
0o0017

var myOptionalValue : Any?
myOptionalValue = 4

if myOptionalValue != nil {
    print("Eu nao sou nil")
} else {
    print("Eu sou nil")
}

if let unwaraped = myOptionalValue {
    print("Eu nao sou nil: \(unwaraped)")
}

let variavel2 = Int("a")


if let firstNumber = Int("4"), let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
    
    "\(firstNumber) < \(secondNumber) < 100"
}


// Cast

//(myOptionalValue as? Int)! + 1

(myOptionalValue as? Int ?? 2) + 1







































