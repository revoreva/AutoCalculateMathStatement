//
//  CalculatorServiceTest.swift
//  AutoCalculateMathStatementTests
//
//  Created by Reva Yoga Pradana on 26/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import Foundation
import Quick
import Nimble
import OHHTTPStubs

@testable import AutoCalculateMathStatement

class CalculatorServiceTest: QuickSpec {
    override func spec() {
        describe("testing CalculatorService.getResult(...)") {
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
            
            it("model should output correctly", closure: {
                stub(condition: { (request:URLRequest) -> Bool in
                    return request.url?.absoluteString == Endpoints.mathJSURL
                }, response: { (request: URLRequest) -> OHHTTPStubsResponse in
                    // API return String, not JSON
                    let responseString = "77"
                    return OHHTTPStubsResponse(data: responseString.data(using: .utf8)!,
                                               statusCode: 200,
                                               headers: nil)
                })
                
                var resultAPI: String?
                
                CalculatorService.getResult(expression: "7*11") { error, model in
                    resultAPI = model.result
                }
                
                expect(resultAPI).toEventuallyNot(beNil(), timeout: 10, pollInterval: 0.2)
                expect(resultAPI).toEventually(equal("77"), timeout: 10, pollInterval: 0.2)
            })
            
            it("should output correctly on real request", closure: {
                var resultAPI: String?
                
                CalculatorService.getResult(expression: "7*11") { error, model in
                    resultAPI = model.result
                }
                
                expect(resultAPI).toEventuallyNot(beNil(), timeout: 10, pollInterval: 0.2)
                expect(resultAPI).toEventually(equal("77"), timeout: 10, pollInterval: 0.2)
            })
        }
    }
}
