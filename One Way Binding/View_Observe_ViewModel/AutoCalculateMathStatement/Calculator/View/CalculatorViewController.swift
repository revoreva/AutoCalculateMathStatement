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
        self.viewModel = CalculatorViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinding()
    }
    
    @IBAction func onTapButtonPresentResult(_ sender: Any) {
        present(viewModel.generateAlert(), animated: true)
    }
    
    private func setupBinding() {
        textField.reactive.text.bind(to: viewModel.statement)
        viewModel.result.bind(to: resultLabel)
    }
}
