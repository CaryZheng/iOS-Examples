//
//  ContentView.swift
//  Example-ZFramework
//
//  Created by Cary on 2020/6/9.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI
import ModuleLogin

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!").padding(40)
                
                NavigationLink(destination: LoginContentView()) {
                   Text("跳转到Login页面")
                }
            }.navigationBarTitle("ContentView", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
