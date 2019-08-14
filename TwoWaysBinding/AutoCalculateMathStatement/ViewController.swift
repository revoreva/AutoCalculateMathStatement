//
//  ViewController.swift
//  MVVMBondSample
//
//  Created by Reva Yoga Pradana on 16/07/19.
//  Copyright © 2019 reva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapButton(_ sender: Any) {
        CalculatorWireframe().show(from: self)
    }
}
