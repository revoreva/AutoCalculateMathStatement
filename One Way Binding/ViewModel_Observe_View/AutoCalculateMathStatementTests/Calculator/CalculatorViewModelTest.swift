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
            
            context("regarding the binding checking") {
                it("should have correct value for result regarding the statements") {
                    
                    let viewController = CalculatorViewController()
                    
                    viewController.loadView()
                    expect(viewController.textField.text).toNotEventually(beNil())
                    expect(viewController.textField.text).toEventually(equal(""))
                    
                    viewController.viewModel.setupBinding()
                    
                    viewController.textField.insertText("2*9+9")
                    
                    expect(viewController.textField.text).toNotEventually(equal(""))
                    expect(viewController.textField.text).toEventually(equal("2*9+9"))
                    expect(viewController.viewModel.result.value).toEventuallyNot(equal(""), timeout: 10, pollInterval: 0.2)
                    expect(viewController.viewModel.result.value).toEventually(equal("27"), timeout: 10, pollInterval: 0.2)
                }
            }
        }
    }
}
