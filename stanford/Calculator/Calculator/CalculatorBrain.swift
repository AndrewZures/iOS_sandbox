import Foundation

class CalculatorBrain
{
    private enum Op : Printable {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand): return "\(operand)";
                case .UnaryOperation(let symbol, _): return symbol;
                case .BinaryOperation(let symbol, _): return symbol;
                }
            }
        }
    }
    
    private var opStack = [Op]();
    private var knownOps = [String: Op]()
    
    init(){
        knownOps = buildKnownOps()
    }
    
    func evaluate() -> Double? {
        let (result, _) = evaluate(opStack)
        return result;
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        
        if(!ops.isEmpty){
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps);
                if let operand = operandEvaluation.result {
                    return(operation(operand), operandEvaluation.remainingOps);
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps);
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return(operation(operand1, operand2), op2Evaluation.remainingOps);
                    }
                }
            }
        }
        
        return (nil, ops);
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String){
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
    
    private func buildKnownOps() -> [String: Op] {
        var ops = [String: Op]()
        
        ops["x"] = Op.BinaryOperation("x", *)
        ops["+"] = Op.BinaryOperation("x", { $0 + $1 })
        ops["-"] = Op.BinaryOperation("x", +)
        ops["div"] = Op.BinaryOperation("div", { $0 * $1 })
        ops["sqrt"] = Op.UnaryOperation("sqrt", sqrt)
        
        return ops
    }

}