import Foundation

public class Calculator {
    
    public init(){}
    
    public func add(stack: [Double]) -> (Double?, [Double]){
        return execute(stack, { $0 + $1 })
    }
    
    public func multiply(stack: [Double]) -> (Double?, [Double]){
        return execute(stack, { $0 * $1 })
    }
    
    public func divide(stack: [Double]) -> (Double?, [Double]){
        return execute(stack, { $1 / $0 })
    }
    
    public func subtract(stack: [Double]) -> (Double?, [Double]){
        return execute(stack, { $1 - $0 })
    }
    
    func execute(var stack: [Double], operand: ((Double, Double) -> Double)) -> (Double?, [Double]){
        if stack.count < 2 { return (nil, stack) }
        
        let calculated = operand(stack.removeLast(), stack.removeLast())
        
        stack.append(calculated)
        return (calculated, stack)
    }
    
}
