//
//  RecordManager.swift
//  Example-Audio
//
//  Created by Cary on 2019/12/3.
//  Copyright © 2019 Cary. All rights reserved.
//

import Foundation
import AVFoundation

class RecordManager {
    
    private static let sharedInstance = RecordManager()
    
    private var appHasAccess = false
    
    static func getInstance() -> RecordManager {
        return sharedInstance
    }
    
    func initRecord() {
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playAndRecord, options: .defaultToSpeaker)
            try session.setActive(true, options: .init())
            
            session.requestRecordPermission { (isGranted: Bool) in
                if isGranted {
                    self.appHasAccess = true
                } else {
                    self.appHasAccess = false
                }
            }
            
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func getFilePath() -> URL {
        let dirPath = NSTemporaryDirectory()
        let fullPath = dirPath + "test.caf"
        return URL(fileURLWithPath: fullPath)
    }
}
