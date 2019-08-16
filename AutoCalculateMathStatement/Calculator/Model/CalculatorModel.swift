//
//  CalculatorModel.swift
//  AutoCalculateMathStatement
//
//  Created by Reva Yoga Pradana on 16/08/19.
//  Copyright © 2019 reva. All rights reserved.
//

import Foundation
import Bond

struct CalculatorModel {
    var statement: Observable<String?> = Observable<String?>("")
    var result: Observable<String> = Observable<String>("")
}
