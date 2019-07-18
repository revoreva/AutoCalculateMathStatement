//
//  CalculatorModel.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 19/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import Foundation

struct CalculatorModel {
    var result: String?
    
    var isResultValid: Bool {
        guard let result = result else { return false }
        
        return Double(result) != nil
    }
}
