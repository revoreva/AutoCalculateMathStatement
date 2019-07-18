//
//  CalculatorViewController.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 18/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var viewModel: CalculatorViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad()
    }
}
