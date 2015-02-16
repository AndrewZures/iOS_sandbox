import UIKit

class ViewController: UIViewController
{
    
    //can start out wired up variables as unwrapped
    //wired up with view changes optional status --> if set early, stays same, can use ! instead of ?
    //"impicitly unwrapped optional"
    @IBOutlet weak var display: UILabel!
    
    var currentlyTypingNumber = false
   
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
        switch operation {
            case "✕": (result, operandStack) = multiply(operandStack)
            
//            case "÷":
//            case "－":
//            case "+":
        default: break
        }
        
        displayResults(result)
    }
    
    func displayResults(result: Double?){
        if (result? != nil) {
            display.text = result!.description
        } else {
            display.text = "0"
        }
    }
    
    func multiply(var arr: [Double]) -> (Double?, [Double]){
        if arr.count < 2 { return (nil, arr) }
        
        let calculated = arr.removeLast() * arr.removeLast()
        arr.append(calculated)
        return (calculated, arr)
    }
    
    
    var operandStack = [Double]()
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

