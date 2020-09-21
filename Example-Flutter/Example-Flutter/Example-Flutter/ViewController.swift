//
//  ViewController.swift
//  Example-Flutter
//
//  Created by Cary on 2019/12/12.
//  Copyright © 2019 Cary. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }

    @objc func showFlutter() {
      let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
      let flutterViewController =
          FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//      present(flutterViewController, animated: true, completion: nil)
        
        let channel = FlutterMethodChannel.init(name: "com.zzb", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
        channel.setMethodCallHandler { [weak self] (call, result) in
            if "getToken" == call.method {
                let userId = call.arguments as? String
                self?.handleGetToken(result: result, userId: userId!)
            }
        }
        
        self.navigationController!.pushViewController(flutterViewController, animated: true)
    }
    
    private func handleGetToken(result: FlutterResult, userId: String) {
        print("ViewController getToken userId = \(userId)")
        
        let token = "TOKEN_1234567890_TEST"
        
        result(token)
    }

}

