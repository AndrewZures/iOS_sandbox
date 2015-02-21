import Foundation

public class Calculator {
    
    public init(){}
    
    public func add(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { $0 + $1 })
    }
    
    public func multiply(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { $0 * $1 })
    }
    
    public func divide(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { $1 / $0 })
    }
    
    public func subtract(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { $1 - $0 })
    }
    
    public func sqrt(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { Darwin.sqrt($0) })
    }
    
    public func sin(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { Darwin.sin($0) })
    }
    
    public func cos(stack: [Double]) -> (Double?, [Double]){
        return operate(stack, { Darwin.cos($0) })
    }
    
    func operate(var stack: [Double], operand: ((Double) -> Double)) -> (Double?, [Double]){
        if stack.count < 1 { return (nil, stack) }
        
        let calculated = operand(stack.removeLast())
        
        stack.append(calculated)
        return (calculated, stack)
    }
    
    func operate(var stack: [Double], operand: ((Double, Double) -> Double)) -> (Double?, [Double]){
        if stack.count < 2 { return (nil, stack) }
        
        let calculated = operand(stack.removeLast(), stack.removeLast())
        
        stack.append(calculated)
        return (calculated, stack)
    }
    
}
