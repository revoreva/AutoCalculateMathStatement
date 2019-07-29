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
    var result: Observable<String> = Observable<String>("")
    
    weak var viewController: CalculatorViewController?
    
    init(viewController: CalculatorViewController?) {
        self.viewController = viewController
    }
    
    func setupBinding() {
        guard let viewController = viewController else { return }
        
        _ = viewController.textField.reactive.text.observeNext { [weak self] newText in
            guard let newText = newText else { return }
            
            self?.requestResult(calculatorStatement: newText) { [weak self] result in
                self?.result.value = result
            }
        }
        
        result.bind(to: viewController.resultLabel)
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
