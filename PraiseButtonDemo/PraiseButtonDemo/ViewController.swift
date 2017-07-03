//
//  ViewController.swift
//  PraiseButtonDemo
//
//  Created by Janlor on 03/07/2017.
//  Copyright © 2017 Janlor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        let btn = PraiseButton(frame: frame)
        btn.frame = frame
        btn.setTitle("赞", for: .normal)
        btn.center = view.center
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

