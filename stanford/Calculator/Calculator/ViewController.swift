import UIKit

class ViewController: UIViewController
{
    
    //can start out wired up variables as unwrapped
    //wired up with view changes optional status --> if set early, stays same, can use ! instead of ?
    //"impicitly unwrapped optional"
    @IBOutlet weak var display: UILabel!
    
    var currentlyTypingNumber = false
    var waitForNextValue = false
    var savedOperation: String?
    var operandStack = [Double]()
   
    @IBAction func appendDigit(sender: UIButton) {
        if currentlyTypingNumber{
            display.text = sender.currentTitle! + display.text!
        } else {
            display.text = sender.currentTitle!
            currentlyTypingNumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        var operation = sender.currentTitle!
        
        if(operandStack.count < 2){
            savedOperation = operation
        } else {
            displayValue = _operate(operation)
        }
        
        if currentlyTypingNumber { enter() }
        
    }
    
    func _operate(operation: String) -> Double? {
        var result: Double?
        let cl = Calculator()
        
        switch operation {
            case "✕":  (result, operandStack) = cl.multiply(operandStack)
            case "÷":  (result, operandStack) = cl.divide(operandStack)
            case "－": (result, operandStack) = cl.subtract(operandStack)
            case "+":  (result, operandStack) = cl.add(operandStack)
            default: break
        }
        
        return result
    }
    
    @IBAction func enter() {
        currentlyTypingNumber = false
        
        operandStack.append(displayValue!)
        if(savedOperation != nil){
            displayValue = _operate(savedOperation!)
        }
        
        println("operand stack= \(operandStack)")
    }
    
    var displayValue: Double? {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set { display.text = (newValue != nil) ? "\(newValue!)" : "" }
    }
    
}

