import XCTest
@testable import BundleManager

final class BundleManagerTests: XCTestCase {


    func testExample() {
        XCTAssertEqual(BundleManager.default.bundleName, nil)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
