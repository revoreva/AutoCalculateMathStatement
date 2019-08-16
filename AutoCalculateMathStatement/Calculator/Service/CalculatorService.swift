//
//  CalculatorService.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 18/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import Foundation
import Alamofire

class CalculatorService {
    private typealias JSON = [String: Any]
    
    static func getResult(expression: String, completion: ((Error?, CalculatorObject) -> Void)?) {
        let params: Parameters = [
            "expr": expression
        ]
        
        Alamofire.request(
            Endpoints.mathJSURL,
            method: .get,
            parameters: params,
            encoding: URLEncoding(destination: .queryString),
            headers: nil
        ).responseString { response in //API return String format
            completion?(response.error, CalculatorObject(result: response.result.value))
        }
    }
}
