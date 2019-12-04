//
//  MyButton.swift
//  Example-Audio
//
//  Created by Cary on 2019/12/4.
//  Copyright © 2019 Cary. All rights reserved.
//

import SwiftUI

struct MyButton: View {
    var title: String
    var onButtonClicked: () -> Void
    
    var body: some View {
        Button(action: onButtonClicked) {
            Text(title)
                .foregroundColor(.blue)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                )
        }
    }
}
