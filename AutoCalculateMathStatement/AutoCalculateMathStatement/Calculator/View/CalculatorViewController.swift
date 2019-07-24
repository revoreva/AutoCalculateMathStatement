//
//  CalculatorViewController.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 18/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit
import Bond

class CalculatorViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var viewModel: CalculatorViewModel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = CalculatorViewModel(viewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad()
    }
}
