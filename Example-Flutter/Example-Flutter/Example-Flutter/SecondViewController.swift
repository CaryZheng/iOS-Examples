//
//  SecondViewController.swift
//  Example-Flutter
//
//  Created by Cary on 2020/9/30.
//  Copyright © 2020 Cary. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        
        let textView = UITextView()
        textView.text = "SecondViewController"
        textView.frame.origin = CGPoint(x: 100, y: 200)
        textView.sizeToFit()
        
        self.view.addSubview(textView)
    }
}
