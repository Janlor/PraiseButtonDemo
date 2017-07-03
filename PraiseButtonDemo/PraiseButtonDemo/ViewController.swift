//
//  ViewController.swift
//  PraiseButtonDemo
//
//  Created by Janlor on 03/07/2017.
//  Copyright © 2017 Janlor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    
    func setupUI() {
        let frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        let btn = PraiseButton(frame: frame)
        btn.center = view.center
        btn.setTitle("赞", for: .normal)
        view.addSubview(btn)
    }

}

