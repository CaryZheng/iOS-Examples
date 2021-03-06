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
    
    @State
    private var recordItems: [RecordItem] = [
//        RecordItem(id: 1, title: "View 1"),
//        RecordItem(id: 2, title: "View 2"),
//        RecordItem(id: 3, title: "View 3")
//        RecordItem(id: 4, title: "View 4"),
//        RecordItem(id: 5, title: "View 5"),
//        RecordItem(id: 6, title: "View 6"),
//        RecordItem(id: 7, title: "View 7"),
//        RecordItem(id: 8, title: "View 8"),
//        RecordItem(id: 9, title: "View 9"),
//        RecordItem(id: 10, title: "View 10"),
//        RecordItem(id: 11, title: "View 11"),
//        RecordItem(id: 12, title: "View 12"),
//        RecordItem(id: 13, title: "View 13"),
//        RecordItem(id: 14, title: "View 14"),
//        RecordItem(id: 15, title: "View 15"),
//        RecordItem(id: 16, title: "View 16"),
//        RecordItem(id: 17, title: "View 17"),
//        RecordItem(id: 18, title: "View 18"),
//        RecordItem(id: 19, title: "View 19")
    ]
    
    var body: some View {
                
        VStack {
            Text("当前状态：\(currentState.getStateInfo())")
                .foregroundColor(Color.gray)
            
            List(recordItems, id: \.id) { item in
                HStack {
                    Text("\(item.id) : " + item.title)
                        .background(Color.red)
                    
                    Spacer()
                    
                    Button(action: {
                        self.onItemPlayButtonClicked(item: item)
                    }) {
                        Text("播放")
                            .foregroundColor(.blue)
                            .font(.system(size: 14))
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    }
                }
            }
            
            HStack {
                MyButton(title: "开始录音", onButtonClicked: {
                    self.currentState = .recording

                    RecordManager.getInstance().setupRecorder()
                    RecordManager.getInstance().startRecord()
                })
                
                MyButton(title: "停止录音", onButtonClicked: {
                    self.currentState = .stop
                    
                    RecordManager.getInstance().stopRecord()
                    
                    self.addItem()
                })
                
//                MyButton(title: "播放录音", onButtonClicked: {
//                    self.currentState = .playing
//
//                    RecordManager.getInstance().playRecord()
//                })
            }
        }
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .top)
    }
    
    private func onItemPlayButtonClicked(item: RecordItem) {
        RecordManager.getInstance().playRecord(index: item.id-1)
    }
    
    private func addItem() {
        let path = RecordManager.getInstance().getRecordFilename()
        recordItems.append(RecordItem(id: recordItems.count+1, title: path))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
