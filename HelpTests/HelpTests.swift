//
//  HelpTests.swift
//  HelpTests
//
//  Created by rvs on 11/01/22.
//

import XCTest
@testable import Help

class HelpTests: XCTestCase {
    
    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    func testUsernameIsNil() throws {
        XCTAssertNoThrow(try validation.validate(username: nil))
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
