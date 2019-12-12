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
        
        // view 1
        let view1 = View1(frame: CGRect(x: 40, y: 100, width: 300, height: 400))
        view1.backgroundColor = UIColor.yellow
        self.view.addSubview(view1)
        
        // view 1_1
        let view11 = View11(frame: CGRect(x: 20, y: 30, width: 100, height: 120))
        view11.backgroundColor = UIColor.green
        view1.addSubview(view11)
        
        // view 1_1_1
        let view111 = View111(frame: CGRect(x: 10, y: 10, width: 60, height: 40))
        view111.backgroundColor = UIColor.gray
        view111.isUserInteractionEnabled = false
        view11.addSubview(view111)
        
        // view 1_2
        let view12 = View12(frame: CGRect(x: 20, y: 200, width: 100, height: 120))
        view12.backgroundColor = UIColor.red
        view1.addSubview(view12)
    }

}

