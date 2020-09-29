//
//  FlutterEventHandler.swift
//  Example-Flutter
//
//  Created by Cary on 2020/9/29.
//  Copyright © 2020 Cary. All rights reserved.
//

import Foundation
import Flutter

class FlutterEventHandler: NSObject {
    
    private var mEventSink: FlutterEventSink?
    
    func startSendEvent() {
        mEventSink?("Test_Event")
    }
}

extension FlutterEventHandler: FlutterStreamHandler {
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        mEventSink = events
        
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        mEventSink = nil
        
        return nil
    }
}
