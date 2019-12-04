//
//  AudioState.swift
//  Example-Audio
//
//  Created by Cary on 2019/12/4.
//  Copyright © 2019 Cary. All rights reserved.
//

import Foundation

enum AudioState {
    case none           // 初始状态
    case recording      // 录音中
    case playing        // 播放中
    case stop           // 停止
    
    func getStateInfo() -> String {
        switch self {
        case .recording:
            return "录音中"
        case .playing:
            return "播放中"
        case .stop:
            return "停止中"
        default:
            return "初始状态"
        }
    }
}
