//
//  CalculatorViewModel.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 18/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit
import Bond

protocol CalculatorViewModelProtocol: class {
    var textField: UITextField! { get set }
    var resultLabel: UILabel! { get set }
}

class CalculatorViewModel {
    weak var delegate: CalculatorViewModelProtocol?

    func onViewDidLoad() {
        setupObserver()
    }
    
    private func setupObserver() {
        _ = delegate?.textField.reactive.text.observeNext { [weak self] newText in
            
            guard let newText = newText else { return }
            
            self?.requestResult(calculatorStatement: newText) { [weak self] result in
                self?.delegate?.resultLabel.text = result
            }
        }
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
