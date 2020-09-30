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

    let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    var flutterViewController: FlutterViewController! = nil
    var channel: FlutterMethodChannel! = nil
    
    let flutterEventHandler = FlutterEventHandler()
    var flutterEventChannel: FlutterEventChannel! = nil
    
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
        
        flutterViewController = FlutterViewController(engine: self.flutterEngine, nibName: nil, bundle: nil)
        channel = FlutterMethodChannel(name: "com.zzb", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
        
        initFLutterEventHandler()
    }

    @objc func showFlutter() {
        channel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            // Flutter call native method
            if "getBatteryLevel" == call.method {
                self?.receiveBatteryLevel(result: result)
                return
            } else if "getToken" == call.method {
                let arguments = call.arguments as? [Any]
                let userId = arguments![0] as? String
                self?.handleGetToken(result: result, userId: userId!)
                return
            }
            
            result(FlutterMethodNotImplemented)
        })
        
        nativeCallFlutterFunc2()
        
        flutterEventHandler.startSendEvent()
        
        self.navigationController!.pushViewController(flutterViewController, animated: true)
    }
    
    private func initFLutterEventHandler() {
        flutterEventChannel = FlutterEventChannel(name: "com.zzb.event", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
        flutterEventChannel.setStreamHandler(flutterEventHandler)
    }
    
    private func nativeCallFlutterFunc() {
        // Native call flutter method
        channel.invokeMethod("didRecieveTranscript", arguments: nil)
    }
    
    private func nativeCallFlutterFunc2() {
        // Native call flutter method
        let token = "nativeCallFlutterFunc2"
        channel.invokeMethod("didRecieveTranscript2", arguments: token)
    }
    
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery info unavailable",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }
    
    private func handleGetToken(result: FlutterResult, userId: String) {
        print("ViewController getToken userId = \(userId)")
        
        let token = "TOKEN_1234567890_TEST_userID_" + userId
        
        result(token)
        
        self.navigationController!.pushViewController(SecondViewController(), animated: true)
    }

}

