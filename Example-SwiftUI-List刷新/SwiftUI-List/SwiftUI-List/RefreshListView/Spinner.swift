//
//  Spinner.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/24.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

struct Spinner: View {
    @Binding var percentage: CGFloat
    var body: some View {
        GeometryReader{ geometry in
            ForEach(1...10, id: \.self) { i in
                Rectangle()
                    .fill(Color.gray)
                    .cornerRadius(1)
                    .frame(width: 2.5, height: 8)
                    .opacity(self.percentage * 10 >= CGFloat(i) ? Double(i)/10.0 : 0)
                    .offset(x: 0, y: -8)
                    .rotationEffect(.degrees(Double(36 * i)), anchor: .bottom)
            }.offset(x: 20, y: 12)
        }.frame(width: 40, height: 40)
    }
}
