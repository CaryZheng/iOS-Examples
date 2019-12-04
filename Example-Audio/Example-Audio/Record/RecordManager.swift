//
//  RecordManager.swift
//  Example-Audio
//
//  Created by Cary on 2019/12/3.
//  Copyright © 2019 Cary. All rights reserved.
//

import Foundation
import AVFoundation

class RecordManager: NSObject {
    
    private static let sharedInstance = RecordManager()
    
    private var mHasRecordPermission = false
    private var mAudioRecorder: AVAudioRecorder!
    private var mAudioPlayer: AVAudioPlayer!
    
    static func getInstance() -> RecordManager {
        return sharedInstance
    }
    
    func initRecord() {
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playAndRecord, options: [.defaultToSpeaker, .allowBluetooth, .allowBluetoothA2DP])
            try session.setActive(true, options: .init())
            
            session.requestRecordPermission { (isGranted: Bool) in
                if isGranted {
                    self.mHasRecordPermission = true
                } else {
                    self.mHasRecordPermission = false
                }
            }
            
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func setupRecorder() {
        let fileURL = getFilePath()
        
        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVSampleRateKey: 44100, // 采样频率
            AVNumberOfChannelsKey: 1,   // 录音声道
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            mAudioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            mAudioRecorder.delegate = self
            mAudioRecorder.prepareToRecord()
        } catch {
            print("setupRecorder fail")
        }
    }
    
    /// 开始录音
    func startRecord() {
        print("startRecord")
        mAudioRecorder.record()
    }
    
    /// 停止录音
    func stopRecord() {
        print("stopRecord")
        mAudioRecorder.stop()
    }
    
    /// 播放录音
    func playRecord() {
        print("playRecord")
        let fileURL = getFilePath()
        
        do {
            mAudioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            mAudioPlayer.delegate = self
            if mAudioPlayer.duration > 0 {
                mAudioPlayer.play()
            }
        } catch {
            print("playRecord fail")
        }
    }
    
    private func getFilePath() -> URL {
        let dirPath = NSTemporaryDirectory()
        let fullPath = dirPath + "test.aac"
        return URL(fileURLWithPath: fullPath)
    }
}

extension RecordManager: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorderDelegate audioRecorderDidFinishRecording")
    }

    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("AVAudioRecorderDelegate audioRecorderEncodeErrorDidOccur")
    }

    func audioRecorderBeginInterruption(_ recorder: AVAudioRecorder) {
        print("AVAudioRecorderDelegate audioRecorderBeginInterruption")
    }

    func audioRecorderEndInterruption(_ recorder: AVAudioRecorder, withOptions flags: Int) {
        print("AVAudioRecorderDelegate audioRecorderEndInterruption")
    }
}

extension RecordManager: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("AVAudioPlayerDelegate audioPlayerDidFinishPlaying")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("AVAudioPlayerDelegate audioPlayerDecodeErrorDidOccur")
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("AVAudioPlayerDelegate audioPlayerBeginInterruption")
    }

    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        print("AVAudioPlayerDelegate audioPlayerEndInterruption")
    }
}
