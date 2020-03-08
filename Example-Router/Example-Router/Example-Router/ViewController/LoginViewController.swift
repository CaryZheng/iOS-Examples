//
//  LoginViewController.swift
//  Example-Router
//
//  Created by Cary on 2020/3/4.
//  Copyright © 2020 Cary. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct User: IRouteParam {
        var username: String
    }
    
    private var mData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login:\(mData.username)"
    }
}

extension LoginViewController: IRouterPage {
    
    func initWithParams(_ param: IRouteParam) {
        guard let data = param as? User else {
            return
        }
        
        mData = data
    }
}
