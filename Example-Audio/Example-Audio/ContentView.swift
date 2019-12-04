//
//  ContentView.swift
//  Example-Audio
//
//  Created by Cary on 2019/11/29.
//  Copyright © 2019 Cary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State
    private var currentState = AudioState.none
    
    var body: some View {
                
        VStack {
            Text("当前状态：\(currentState.getStateInfo())")
                .foregroundColor(Color.gray)
            Spacer()
            
            HStack {
                Button(action: {
                    self.currentState = .recording
                    
                    RecordManager.getInstance().startRecord()
                }) {
                    Text("开始录音")
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    self.currentState = .stop

                    RecordManager.getInstance().stopRecord()
                }) {
                    Text("停止录音")
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }

                Button(action: {
                    self.currentState = .playing

                    RecordManager.getInstance().playRecord()
                }) {
                    Text("播放录音")
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
            }
        }
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
