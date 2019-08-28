//
//  CalculatorViewControllerTest.swift
//  AutoCalculateMathStatementTests
//
//  Created by Reva Yoga Pradana on 27/08/19.
//  Copyright © 2019 reva. All rights reserved.
//

import Foundation
import Bond
import Nimble
import OHHTTPStubs
import Quick

@testable import AutoCalculateMathStatement

class CalculatorViewControllerTest: QuickSpec {
    override func spec() {
        describe("testing the binding") {
            context("about the binding between changed textfield value and changed label value") {
                it("should have correct value for result regarding the statements") {
                    stub(condition: { (request:URLRequest) -> Bool in
                        return request.url?.absoluteString == Endpoints.mathJSURL
                    }, response: { (request: URLRequest) -> OHHTTPStubsResponse in
                        // API return String, not JSON
                        let responseString = "42"
                        return OHHTTPStubsResponse(data: responseString.data(using: .utf8)!,
                                                   statusCode: 200,
                                                   headers: nil)
                    })
                    
                    let viewController = CalculatorViewController()
                    viewController.loadView()
                    viewController.setupBinding()
                    
                    viewController.textField.insertText("2*20+2")
                    expect(viewController.viewModel.model.statement.value).toEventually(equal("2*20+2"))
                    expect(viewController.viewModel.model.result.value).toEventually(equal("42"))
                    expect(viewController.resultLabel.text).toEventually(equal("42"))
                }
            }
            
            context("about the on tap reset button") {
                it("should reset both textfield, label, and the model's value") {
                    stub(condition: { (request:URLRequest) -> Bool in
                        return request.url?.absoluteString == Endpoints.mathJSURL
                    }, response: { (request: URLRequest) -> OHHTTPStubsResponse in
                        // API return String, not JSON
                        let responseString = "34"
                        return OHHTTPStubsResponse(data: responseString.data(using: .utf8)!,
                                                   statusCode: 200,
                                                   headers: nil)
                    })
                    
                    let viewController = CalculatorViewController()
                    viewController.loadView()
                    viewController.setupBinding()
                    
                    viewController.textField.insertText("3*10+9-5")
                    expect(viewController.viewModel.model.statement.value).toEventually(equal("3*10+9-5"))
                    expect(viewController.viewModel.model.result.value).toEventually(equal("34"))
                    expect(viewController.resultLabel.text).toEventually(equal("34"))
                    
                    viewController.onTapClearButton(0)
                    expect(viewController.viewModel.model.statement.value).toEventually(beEmpty())
                    expect(viewController.viewModel.model.result.value).toEventually(beEmpty())
                    expect(viewController.textField.text).toEventually(beEmpty())
                    expect(viewController.resultLabel.text).toEventually(beEmpty())
                }
            }
        }
    }
}
