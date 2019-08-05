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
    
    var viewModel: CalculatorViewModel = CalculatorViewModel()
    var wireframe: CalculatorWireframe = CalculatorWireframe()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        wireframe.presentedViewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        viewModel.setupBinding()
    }
}

private extension CalculatorViewController {
    func setupView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backAction))
    }
    
    @objc func backAction() {
        wireframe.back(isAnimated: true)
    }
    
    @IBAction func onTapButtonPresentResult(_ sender: Any) {
        wireframe.presentAlert(viewModel: viewModel)
    }
}
