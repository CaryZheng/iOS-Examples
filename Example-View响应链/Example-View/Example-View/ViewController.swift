//
//  ViewController.swift
//  Example-View
//
//  Created by Cary on 2019/12/11.
//  Copyright © 2019 Cary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view1 = View1(frame: CGRect(x: 40, y: 100, width: 300, height: 400))
        view1.backgroundColor = UIColor.yellow
        
        self.view.addSubview(view1)
        
        let view11 = View11(frame: CGRect(x: 20, y: 30, width: 100, height: 120))
        view11.backgroundColor = UIColor.green
        view1.addSubview(view11)
    }

}

