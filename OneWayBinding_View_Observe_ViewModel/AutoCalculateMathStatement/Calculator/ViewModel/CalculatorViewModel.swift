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
    var statement: Observable<String?> = Observable<String?>("")
    var result: Observable<String> = Observable<String>("")
    
    init() {
        setupAction()
    }
    
    private func setupAction() {
        _ = statement.observeNext { [weak self] newText in
            
            guard let newText = newText else { return }
            
            self?.requestResult(calculatorStatement: newText) { [weak self] result in
                self?.result.value = result
            }
        }
    }
    
    func generateAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Result", message: result.value, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("OK", comment: "Default action"),
                style: .default,
                handler: { _ in
                    NSLog("The \"OK\" alert occured.")
            }))
        
        return alert
    }
    
    private func requestResult(calculatorStatement: String, completion: ((String) -> Void)?) {
        CalculatorService.getResult(expression: calculatorStatement) { error, model in
            guard error == nil, model.isResultValid, let result = model.result else {
                completion?("")
                return
            }
            
            completion?(result)
        }
    }
}
