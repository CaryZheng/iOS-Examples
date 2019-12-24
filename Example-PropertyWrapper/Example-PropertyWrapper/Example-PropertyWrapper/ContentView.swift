//
//  ContentView.swift
//  Example-PropertyWrapper
//
//  Created by Cary on 2019/12/24.
//  Copyright © 2019 Cary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var username: String = DataManager.getInstance().getUsername()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Value1: \(username)")
            }.padding()
            
            HStack {
                Button(action: {
                    DataManager.getInstance().setUsername(value: "Cary1 with PropertyWrapper")
                    
                    self.username = DataManager.getInstance().getUsername()
                }) {
                    Text("测试1")
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                }
                
                Button(action: {
                    UserDefaults.standard.set("Cary2 with default", forKey: "username")
                    
                    self.username = (UserDefaults.standard.object(forKey: "username") as? String) ?? ""
                }) {
                    Text("测试2")
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
