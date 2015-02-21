import UIKit

class ViewController: UIViewController
{
    
    //can start out wired up variables as unwrapped
    //wired up with view changes optional status --> if set early, stays same, can use ! instead of ?
    //"impicitly unwrapped optional"
    @IBOutlet weak var display: UILabel!
    
    var currentlyTypingNumber = false
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
        if currentlyTypingNumber { enter() }
        
        var result: Double?
        
        let operation = sender.currentTitle!
        let cl = Calculator()
        
        switch operation {
            case "✕":  (result, operandStack) = cl.multiply(operandStack)
            case "÷":  (result, operandStack) = cl.divide(operandStack)
            case "－": (result, operandStack) = cl.subtract(operandStack)
            case "+":  (result, operandStack) = cl.add(operandStack)
        default: break
        }
        
        displayValue = result!
    }
    
    @IBAction func enter() {
        currentlyTypingNumber = false
        operandStack.append(displayValue)
        println("operand stack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            currentlyTypingNumber = false
        }
    }
    
}

