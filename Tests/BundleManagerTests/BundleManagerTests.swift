import XCTest
@testable import BundleManager

final class BundleManagerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BundleManager().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
