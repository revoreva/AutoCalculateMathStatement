//
//  CalculatorWireframe.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 19/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit

class CalculatorWireframe {
    func show(from vc: UIViewController) {
        let calculatorVC = create()
        
        vc.navigationController?.pushViewController(calculatorVC, animated: true)
    }
}

// MARK: - Private Implementation
private extension CalculatorWireframe {
    func create() -> CalculatorViewController {
        let vc = CalculatorViewController()
        return vc
    }
}
