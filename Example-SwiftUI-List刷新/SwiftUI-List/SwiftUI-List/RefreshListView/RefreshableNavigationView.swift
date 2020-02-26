//
//  RefreshableNavigationView.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/23.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

public struct RefreshableNavigationView<Content: View>: View {
    
    private var title: String
    private let action: () -> Void
    private let content: () -> Content
    
    @State public var showRefreshView: Bool = false
    @State public var pullStatus: CGFloat = 0
    
    public init(title: String, action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.action = action
        self.content = content
    }
    
    public var body: some View {
        NavigationView{
            RefreshableList(showRefreshView: $showRefreshView, pullStatus: $pullStatus, action: self.action) {
                self.content()
            }.navigationBarTitle(title)
        }
        .offset(x: 0, y: self.showRefreshView ? 34 : 0)
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}
