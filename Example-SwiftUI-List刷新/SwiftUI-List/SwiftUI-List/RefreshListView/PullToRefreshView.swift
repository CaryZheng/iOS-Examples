//
//  PullToRefreshView.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/25.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

struct PullToRefreshView: View {
    
    @Binding var showRefreshView: Bool
    @Binding var pullStatus: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            RefreshView(isRefreshing: self.$showRefreshView, status: self.$pullStatus)
                .opacity(Double((geometry.frame(in: CoordinateSpace.global).origin.y - 106) / 80))
                .preference(key: RefreshableKeyTypes.PrefKey.self, value: [RefreshableKeyTypes.PrefData(bounds: geometry.frame(in: CoordinateSpace.global))])
                .offset(x: 0, y: -90)
        }
    }
}
