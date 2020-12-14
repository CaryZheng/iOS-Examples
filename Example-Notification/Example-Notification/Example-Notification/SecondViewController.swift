//
//  SecondViewController.swift
//  Example-Notification
//
//  Created by Cary on 2020/12/7.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.center = self.view.center
        button.setTitle("Test2", for: .normal)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(.blue, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(onBuuttonClicked), for: .touchUpInside)
    }
    
    @objc func onBuuttonClicked() {
        // 发送通知
        NotificationCenter.default.post(name: Notification.Name("myTest"), object: nil)
    }
}
