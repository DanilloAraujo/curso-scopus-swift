//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Danillo on 22/11/2017.
//  Copyright © 2017 CINQ. All rights reserved.
//

import Foundation
struct CalculatorManager {
    
    enum Operation {
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
        case unknow
    }
    
    private struct PreviousBinaryOperation {
        let function:(Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private var accumulator: Double = 0.0
    private var binaryOperationMemory: PreviousBinaryOperation?
    private let operations = [
        "+" : Operation.binaryOperation({$0 + $1}),
        "-" : Operation.binaryOperation({$0 - $1}),
        "⨉" : Operation.binaryOperation({$0 * $1}),
        "÷" : Operation.binaryOperation({$0 / $1}),
        "=" : Operation.equals,
        "±" : Operation.unaryOperation({$0 == 0 ? $0 : -$0}),
        //"%" : Operation.unaryOperation,
        "√" : Operation.unaryOperation(sqrt)
    ]
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    mutating func perfomOperation(_ symbol:String) {
        guard let operation = operations[symbol] else {
            return
        }
        switch operation {
        case .unaryOperation(let op):
            self.accumulator = op(accumulator)
        case .binaryOperation(let op ):
            binaryOperationMemory = PreviousBinaryOperation(function: op, firstOperand: self.accumulator)
        case .equals:
            doPreviousBinaryOperation()
        default:
            break
        }
    }
    
    mutating func doPreviousBinaryOperation() {
        guard let memory = binaryOperationMemory else { return }
        self.accumulator = memory.perform(with: accumulator)
        self.binaryOperationMemory = nil
    }
    
    mutating func setOperand(_ operation:Double) {
        self.accumulator = operation
    }
}
