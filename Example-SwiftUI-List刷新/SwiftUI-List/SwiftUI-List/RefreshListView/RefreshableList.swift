//
//  RefreshableList.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/24.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

struct RefreshableList<Content: View>: View {
    
    @Binding var showRefreshView: Bool
    @Binding var pullStatus: CGFloat
    private let action: () -> Void
    private let content: () -> Content
    
    init(showRefreshView: Binding<Bool>, pullStatus: Binding<CGFloat>, action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self._showRefreshView = showRefreshView
        self._pullStatus = pullStatus
        self.action = action
        self.content = content
    }
    
    var body: some View {
        List{
            PullToRefreshView(showRefreshView: $showRefreshView, pullStatus: $pullStatus)
            content()
        }
        .onPreferenceChange(RefreshableKeyTypes.PrefKey.self) { values in
            guard let bounds = values.first?.bounds else { return }
            self.pullStatus = CGFloat((bounds.origin.y - 106) / 80)
            self.refresh(offset: bounds.origin.y)
        }.offset(x: 0, y: -40)
    }
    
    func refresh(offset: CGFloat) {
        if offset > 185 && false == showRefreshView {
            self.showRefreshView = true
            
            DispatchQueue.main.async {
                self.action()
                DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                    self.showRefreshView = false
                }
            }
        }
    }
}
