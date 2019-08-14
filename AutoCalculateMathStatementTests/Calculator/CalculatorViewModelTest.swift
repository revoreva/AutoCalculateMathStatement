//
//  CalculatorViewModelTest.swift
//  AutoCalculateMathStatementTests
//
//  Created by Reva Yoga Pradana on 01/08/19.
//  Copyright © 2019 reva. All rights reserved.
//

import Foundation
import Bond
import Nimble
import OHHTTPStubs
import Quick

@testable import AutoCalculateMathStatement

class CalculatorViewModelTest: QuickSpec {
    override func spec() {
        describe("testing about statements and result") {
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
            
            it("should have correct value for result regarding the statements") {
                let viewModel = CalculatorViewModel()
                
                viewModel.statement.value = "2*9+9"
                
                expect(viewModel.result.value).toEventuallyNot(beNil(), timeout: 10, pollInterval: 0.2)
                expect(viewModel.result.value).toEventually(equal("27"), timeout: 10, pollInterval: 0.2)
            }
        }
    }
}
