import XCTest
import Calculator

class CalculatorTest: XCTestCase {

    func testAddsAndReturnCorrectStack() {
        var (result, rest) = Calculator().add([1,2,5])
        XCTAssertEqual(7, result!)
        XCTAssertEqual([1,7], rest)
    }
    
    func testSubtractsAndsReturnsCorrectStack() {
        var (result, rest) = Calculator().subtract([1,5,2])
        XCTAssertEqual(3, result!)
        XCTAssertEqual([1,3], rest)
    }
    
    func testDividesAndsReturnsCorrectStack() {
        var (result, rest) = Calculator().divide([1,6,2])
        XCTAssertEqual(3, result!)
        XCTAssertEqual([1,3], rest)
    }
    
    func testMultipliesAndsReturnsCorrectStack() {
        var (result, rest) = Calculator().multiply([1,3,2])
        XCTAssertEqual(6, result!)
        XCTAssertEqual([1,6], rest)
    }

}
