//
//  CalculatorWireframe.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 19/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit

class CalculatorWireframe {
    weak var presentedViewController: CalculatorViewController?
    
    func show(from vc: UIViewController) {
        let calculatorVC = create()
        
        vc.navigationController?.pushViewController(calculatorVC, animated: true)
    }
    
    func back(isAnimated: Bool = true) {
        presentedViewController?.navigationController?.popViewController(animated: isAnimated)
    }
    
    func presentAlert(isAnimated: Bool = true, viewModel: CalculatorViewModel, completion: (() -> Void)? = nil) {
        presentedViewController?.present(viewModel.generateAlert(), animated: isAnimated, completion: completion)
    }
}

// MARK: - Private Implementation
private extension CalculatorWireframe {
    func create() -> CalculatorViewController {
        let vc = CalculatorViewController()
        return vc
    }
}
