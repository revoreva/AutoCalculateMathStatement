//
//  CalculatorViewModel.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 18/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit
import Bond

class CalculatorViewModel {
    var model: CalculatorModel = CalculatorModel()
    
    init() {
        _ = model.statement.observeNext { [weak self] newText in
            self?.requestResult(calculatorStatement: newText)
        }
    }
    
    func generateAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Result", message: model.result.value, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("OK", comment: "Default action"),
                style: .default,
                handler: { _ in
                    NSLog("The \"OK\" alert occured.")
            }))
        
        return alert
    }
}

// MARK: - Private Implementation
extension CalculatorViewModel {
    func requestResult(calculatorStatement: String?) {
        guard let calculatorStatement = calculatorStatement else { return }
        
        CalculatorService.getResult(expression: calculatorStatement) { [weak self] error, model in
            guard error == nil, model.isResultValid, let result = model.result else {
                self?.model.result.value = ""
                return
            }
            
            self?.model.result.value = result
        }
    }
}
