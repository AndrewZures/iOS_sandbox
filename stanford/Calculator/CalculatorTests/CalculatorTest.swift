import XCTest
import Calculator

class CalculatorTest: XCTestCase {

    func testAddsAndReturnCorrectStack() {
        let (result, rest) = Calculator().add([1,2,5])
        
        XCTAssertEqual(7, result!)
        XCTAssertEqual([1,7], rest)
    }
    
    func testSubtractsAndsReturnsCorrectStack() {
        let (result, rest) = Calculator().subtract([1,5,2])
        
        XCTAssertEqual(3, result!)
        XCTAssertEqual([1,3], rest)
    }
    
    func testDividesAndsReturnsCorrectStack() {
        let (result, rest) = Calculator().divide([1,6,2])
        
        XCTAssertEqual(3, result!)
        XCTAssertEqual([1,3], rest)
    }
    
    func testMultipliesAndsReturnsCorrectStack() {
        let (result, rest) = Calculator().multiply([1,3,2])
        
        XCTAssertEqual(6, result!)
        XCTAssertEqual([1,6], rest)
    }
    
    func testSqrtAndReturnsCorrectStack(){
        let (result, rest) = Calculator().sqrt([1,3,16])
        XCTAssertEqual(4, result!)
        XCTAssertEqual([1,3,4], rest)
    }
    
    func testSinAndReturnsCorrectStack(){
        let sinOfTwo = 0.90929742682
        let (result, rest) = Calculator().sin([1,3,2])
        
        XCTAssertEqualWithAccuracy(sinOfTwo, result!, 0.00001)
        XCTAssertEqualWithAccuracy([1,3, sinOfTwo].reduce(0,+), rest.reduce(0,+), 0.00001)
    }
    
    func testCosAndReturnsCorrectStack(){
        let cosOfTwo = -0.41614683654
        let (result, rest) = Calculator().cos([1,3,2])
        
        XCTAssertEqualWithAccuracy(cosOfTwo, result!, 0.00001)
        XCTAssertEqualWithAccuracy([1,3, cosOfTwo].reduce(0,+), rest.reduce(0,+), 0.00001)
    }

}
