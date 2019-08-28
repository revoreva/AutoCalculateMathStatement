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
            context("about the statement and the result") {
                it("should have correct value for result regarding the statements") {
                    stub(condition: { (request:URLRequest) -> Bool in
                        return request.url?.absoluteString == Endpoints.mathJSURL
                    }, response: { (request: URLRequest) -> OHHTTPStubsResponse in
                        // API return String, not JSON
                        let responseString = "27"
                        return OHHTTPStubsResponse(data: responseString.data(using: .utf8)!,
                                                   statusCode: 200,
                                                   headers: nil)
                    })
                    
                    let viewModel = CalculatorViewModel()
                    
                    viewModel.model.statement.value = "2*9+9"
                    expect(viewModel.model.result.value).toEventuallyNot(beNil())
                    expect(viewModel.model.result.value).toEventually(equal("27"))
                }
            }
            
            context("about the reset function") {
                it("should working properly") {
                    stub(condition: { (request:URLRequest) -> Bool in
                        return request.url?.absoluteString == Endpoints.mathJSURL
                    }, response: { (request: URLRequest) -> OHHTTPStubsResponse in
                        // API return String, not JSON
                        let responseString = "40"
                        return OHHTTPStubsResponse(data: responseString.data(using: .utf8)!,
                                                   statusCode: 200,
                                                   headers: nil)
                    })
                    
                    let viewModel = CalculatorViewModel()
                    
                    viewModel.model.statement.value = "2*20+5-5"
                    expect(viewModel.model.result.value).toEventuallyNot(beNil())
                    expect(viewModel.model.result.value).toEventually(equal("40"))
                    
                    viewModel.reset()
                    expect(viewModel.model.statement.value).toEventually(beEmpty())
                    expect(viewModel.model.result.value).toEventually(beEmpty())
                }
            }
        }
    }
}
