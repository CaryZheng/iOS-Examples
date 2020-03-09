//
//  ViewController.swift
//  Example-Router
//
//  Created by Cary on 2020/3/3.
//  Copyright © 2020 Cary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Home"
        
        test()
    }

    private func test() {
//        Router.open(urlLink: "https://www.carymic.com", fromVC: self)
        
        let user = User(username: "Tony")
        Router.open(path: .login(user), fromVC: self)
        
//        Router.open(path: .register, fromVC: self)
    }

}
