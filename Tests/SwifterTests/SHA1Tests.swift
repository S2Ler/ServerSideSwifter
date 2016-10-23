import Foundation

import XCTest

@testable import Swifter

class SHA1Tests: XCTestCase {
    func testSHA1() {
        let input = "Hello"
        let expected = "9/+ei3uy4Jtwk1pdeF4MxdnQq/A="
        let inputData = input.data(using: .utf8)!
        let sha1 = SHA1(inputData.rawBytes)

        let sha1DataArray: [UInt8] = sha1.calculate()

        let sha1Data =  Data(bytes: UnsafePointer<UInt8>(sha1DataArray), count: sha1DataArray.count)
        let sha1Result = sha1Data.base64EncodedString()

        XCTAssertEqual(sha1Result, expected)
    }

    static let allTests =  [
        ("testSHA1", testSHA1)
    ]
}
