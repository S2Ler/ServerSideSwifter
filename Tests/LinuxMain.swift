import XCTest
@testable import SwifterTests

XCTMain([
    testCase(SHA1Tests.allTests),
    testCase(String_SwifterTests.allTests)
])
