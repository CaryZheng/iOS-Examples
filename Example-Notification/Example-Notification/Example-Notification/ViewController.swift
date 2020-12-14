//
//  ViewController.swift
//  Example-Notification
//
//  Created by Cary on 2020/12/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.center = self.view.center
        button.setTitle("Test", for: .normal)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(.blue, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(onBuuttonClicked), for: .touchUpInside)
        
        // 监听通知
        NotificationCenter.default.addObserver(self, selector: #selector(onTestEventTrigger), name: Notification.Name("myTest"), object: nil)
    }
    
    deinit {
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }

    @objc func onBuuttonClicked() {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    @objc func onTestEventTrigger() {
        print("onTestEventTrigger")
    }

}

