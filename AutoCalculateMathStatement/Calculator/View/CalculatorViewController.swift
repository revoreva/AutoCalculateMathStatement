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
    @IBOutlet weak var loadingLabel: UILabel!
    
    var viewModel: CalculatorViewModel = CalculatorViewModel()
    var wireframe: CalculatorWireframe = CalculatorWireframe()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        wireframe.presentedViewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBinding()
    }
    
    func setupBinding() {
        textField.reactive.text.bidirectionalBind(to: viewModel.model.statement)
        viewModel.model.result.bind(to: resultLabel)
        viewModel.showLoading.bind(to: self) { vc, _ in
            vc.showLoading()
        }
        viewModel.hideLoading.bind(to: self) { vc, _ in
            vc.hideLoading()
        }
    }
    
    func showLoading() {
        loadingLabel.isHidden = false
    }
    
    func hideLoading() {
        loadingLabel.isHidden = true
    }
    
    @IBAction func onTapClearButton(_ sender: Any) {
        viewModel.reset()
    }
}

// MARK: - Private Implementation
private extension CalculatorViewController {
    func setupView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backAction))
        loadingLabel.isHidden = true
    }
    
    @objc func backAction() {
        wireframe.back(isAnimated: true)
    }
}
