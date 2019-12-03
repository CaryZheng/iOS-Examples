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
    private var currentState = 1
    
    var body: some View {
                
        VStack(alignment: .center) {
            Text("当前状态：\(currentState)")
            Spacer()
            
            Button(action: {
                self.currentState += 1
            }) {
                HStack {
                    Text("Play")
                }
                .cornerRadius(40)
                .padding(10)
                .foregroundColor(.blue)
                .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .leading, endPoint: .trailing))
            }
        }
        .background(Color.yellow)
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
