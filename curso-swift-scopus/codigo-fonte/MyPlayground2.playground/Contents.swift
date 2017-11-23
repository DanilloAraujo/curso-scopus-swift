//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let metadeIndex = str.index(str.startIndex, offsetBy: str.count/2)
str[str.startIndex..<metadeIndex]

let buscar: Character = ","

let indiceDaVirgula = str.index(of: buscar) ?? str.startIndex
str[str.index(after: indiceDaVirgula) ... str.index(before: str.endIndex)]
str[str.startIndex ..< indiceDaVirgula]
str[str.startIndex ... indiceDaVirgula]



let range1 = 1...5
let range2 = 1..<5

var array1 =  [1, 2, 3, 4, 5]
array1[0..<1] = [0, 1]
array1
array1[0...1] = [0, 1]
array1

switch "v4" {
case "v1", "v2":
    print("v1 ou v2")
case let x where x.hasSuffix("5"):
    print("Termina com 5")
default:
    break
}

switch ("curto", "x") {
case let (v1, v2) where v1 == v2:
    print("Sao iguais")
case ("curto", _):
    print("Encontrei a palavra curto")
default:
    break
}

let switchint: UInt64 = UInt64(2<<(7 * (4 + 3))-1)

switch switchint {
case 0 ... UInt64(UInt8.max):
    "UInt8 invterval"
case 0 ... UInt64(UInt16.max):
    "UInt16 invterval"
case 0 ... UInt64(UInt32.max):
    "UInt32 invterval"
case 0 ... UInt64(UInt64.max):
    "UInt64 invterval"
default:
    break
}

let switchTuple = (500, "oK")


switch switchTuple {
case (200, "OK"):
    "mensagem padrao OK"
case (200, let message):
    "mensagem do let \(message)"
case (100...700, _):
    "Status http"
    //fallthrough
case (500...600, _):
    "Ocorreu um erro"
default:
    break
}



// For

var total = 0

for i in 0...500 {
    total += i
}

print("\n\n")

for c in "teste!" {
    print(c)
}

print("\n\n")

let arrayFor = [1,2,3,4,5,6]

for i in arrayFor {
    print(i)
}

print("\n\n")

for (i, c) in arrayFor.enumerated() {
    print("Indice: \(i) Numero: \(c)")
}

print("\n\n")

for (i, c) in arrayFor.reversed().enumerated() {
    print("Indice: \(i) Numero: \(c)")
}

print("\n\n")

let dictionary = [200:"OK", 403:"Forbiden", 500:"Internal Server Error"]

for d in dictionary {
    print("Key: \(d.key) Valor: \(d.value)")
}

print("\n\n")

for d in dictionary.sorted(by: <) {
    print("Key: \(d.key) Valor: \(d.value)")
}

var index = 10

repeat {
    print("Teste")
    index -= 1
} while (index < 9)
