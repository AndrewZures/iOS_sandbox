import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var display: UILabel!
    
    var currentlyTypingNumber: Bool = false
   
    @IBAction func appendDigit(sender: UIButton) {
        if currentlyTypingNumber{
            display.text = sender.currentTitle! + display.text!
        } else {
            display.text = sender.currentTitle!
            currentlyTypingNumber = true
        }
    }
    
}

