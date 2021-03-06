import XCTest
import Quick
import Nimble
#if SWIFT_PACKAGE
import QuickTestHelpers
#endif

class Configuration_BeforeEachSpec: QuickSpec {
    override func spec() {
        it("is executed after the configuration beforeEach") {
            expect(FunctionalTests_Configuration_BeforeEachWasExecuted).to(beTruthy())
        }
    }
}

class Configuration_BeforeEachTests: XCTestCase, XCTestCaseProvider {
    var allTests: [(String, () throws -> Void)] {
        return [
            ("testExampleIsRunAfterTheConfigurationBeforeEachIsExecuted", testExampleIsRunAfterTheConfigurationBeforeEachIsExecuted),
        ]
    }

    func testExampleIsRunAfterTheConfigurationBeforeEachIsExecuted() {
        FunctionalTests_Configuration_BeforeEachWasExecuted = false

        qck_runSpec(Configuration_BeforeEachSpec.self)
        XCTAssert(FunctionalTests_Configuration_BeforeEachWasExecuted)

        FunctionalTests_Configuration_BeforeEachWasExecuted = false
    }
}
