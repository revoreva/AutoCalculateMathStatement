//
//  CalculatorServiceTest.swift
//  AutoCalculateMathStatementTests
//
//  Created by Reva Yoga Pradana on 29/07/19.
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
            
            it("model should output correctly") {
                stub(
                    condition: { (request:URLRequest) -> Bool in
                        return request.url?.absoluteString == Endpoints.mathJSURL
                    },
                    response: { (request: URLRequest) -> OHHTTPStubsResponse in
                        // API return String, not JSON
                        let responseString = "77"
                        return OHHTTPStubsResponse(data: responseString.data(using: .utf8)!,
                                                   statusCode: 200,
                                                   headers: nil)
                    }
                )
                
                waitUntil { done in
                    CalculatorService.getResult(expression: "7*11") { error, model in
                        guard let model = model else {
                            fail()
                            return
                        }
                        
                        expect(model.result).toNot(beNil())
                        expect(model.result).to(equal("77"))
                        
                        done()
                    }
                }
            }
        }
    }
}

