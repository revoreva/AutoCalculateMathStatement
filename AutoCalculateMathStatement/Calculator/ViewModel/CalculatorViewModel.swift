//
//  CalculatorViewModel.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 18/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class CalculatorViewModel {
    var model: CalculatorModel = CalculatorModel()
    var showLoading: Subject<Void, Never> = Subject<Void, Never>()
    var hideLoading: Subject<Void, Never> = Subject<Void, Never>()
    
    init() {
        _ = model.statement.observeNext { [weak self] newText in
            self?.requestResult(calculatorStatement: newText)
        }
    }
    
    func reset() {
        model.statement.value = ""
        model.result.value = ""
    }
}

// MARK: - Private Implementation
private extension CalculatorViewModel {
    func requestResult(calculatorStatement: String?) {
        guard let calculatorStatement = calculatorStatement else { return }
        
        showLoading.send()
        
        CalculatorService.getResult(expression: calculatorStatement) { [weak self] error, model in
            self?.hideLoading.send()
            
            guard error == nil, model.isResultValid, let result = model.result else {
                self?.model.result.value = ""
                return
            }
            
            self?.model.result.value = result
        }
    }
}
