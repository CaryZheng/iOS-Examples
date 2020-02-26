//
//  RefreshView.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/24.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

struct RefreshView: View {
    @Binding var isRefreshing: Bool
    @Binding var status: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                if (!isRefreshing) {
                    Spinner(percentage: $status)
                }else{
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                Text(isRefreshing ? "Loading" : "Pull to refresh").font(.caption)
            }
            Spacer()
        }
    }
}
