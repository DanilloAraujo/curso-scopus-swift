//: Playground - noun: a place where people can play

import UIKit

func somas (_ a: Int, _ b: Int) -> Int {
    return a + b
}
somas(1,3)

func soma (com a: Int, e b: Int) -> Int {
    return a + b
}
soma(com: 1, e: 2)

func somasubtrai(_ a:Int, _ b:Int) -> (Int, Int) {
    return (a + b, a - b)
}
somasubtrai(2, 4)

func soma(valores:Int ...) -> Int {
    var total = 0
    for i in valores {
        total += i
    }
    return total
}
soma(valores:1,2,3,4)

func soma(default:Int, valores:Int ...) -> Int {
    var total = `default`
    for i in valores {
        total += i
    }
    return total
}
soma(default:1, valores:1,2,3,4)

var resultadoSoma: Int = 0
func soma(referencia:inout Int, valores: Int...) {
    for i in valores {
        referencia += i
    }
}
soma(referencia:&resultadoSoma, valores: 4,5,6)

func find(inArray values: [Any], withPredicate predicate: (Any) -> Bool ) -> Int? {
    
    for (k,v) in values.enumerated() {
        if predicate(v) {
            return k
        }
    }
    
    return nil
}

func getIndex(valor: Any) -> Bool {
    return valor as! String == "b"
}

var index1 = find(inArray: ["a","b","c","d"], withPredicate: getIndex)

var index = find(inArray: ["a","b","c","d"]) { $0 as! String == "c"}
index

func binaryOperation(_ operador: String) -> ((Double, Double) -> Double)? {
    switch operador {
    case "+":
        return  {(val1: Double, val2: Double) -> Double in val1 + val2}
    case "×":
        return {(val1: Double, val2: Double) -> Double in val1 * val2}
    case "−":
        return {(val1: Double, val2: Double) -> Double in val1 - val2}
    case "÷":
        return {(val1: Double, val2: Double) -> Double in val1 / val2}
    default:
        return nil
    }
}

func binaryOperationReduce(_ operador: String) -> ((Double, Double) -> Double)? {
    switch operador {
    case "+":
        return  {$0 + $1}
    case "×":
        return {$0 * $1}
    case "−":
        return {$0 - $1}
    case "÷":
        return {$0 / $1}
    default:
        return nil
    }
}

binaryOperation("+")?(10,20)
binaryOperationReduce("+")?(10,20)
binaryOperation("×")?(10,20)
binaryOperationReduce("×")?(10,20)
binaryOperation("−")?(10,20)
binaryOperationReduce("−")?(10,20)
binaryOperation("÷")?(10,20)
binaryOperationReduce("÷")?(10,20)
binaryOperation("")?(10,20)
binaryOperationReduce("")?(10,20)


func binaryOp(_ op: String) -> ((Double, Double) -> Double)? {
    
    func sum(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func subtract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    var dict: [String: (Double, Double) -> Double] = [:]
    dict["+"] = sum
    dict["−"] = subtract
    
    return dict[op]
}

binaryOp("+")?(5,3)

// Closure
func iterator(_ array: [Int]) -> () -> Int? {
    var i = 0
    return  {
        i += 1
        return i <= array.count ? array[i - 1] : nil
    }
}
let arrayTeste = [1,2,3,4,5,6]
let it = iterator(arrayTeste)
it()
it()
it()
it()
it()
it()
it()


//Guard Let
func processUser(_ name: String) -> (Float, String)? {
    let dict1 = ["Danillo": 1000.0, "Jose": 400.0]
    let dict2 = ["Danillo": "Araujo", "Jose": "Das Couves"]
    
    guard let money = dict1[name] else { return nil }
    guard let sobrenome = dict2[name] else { return nil }
    
    return (Float(money), "\(name) \(sobrenome)")
}

processUser("Danillo")
processUser("Joao")


var overflow: Int = Int.max
overflow = overflow &+ 1

2 + 2 + 2
(2 << 2) << 2

