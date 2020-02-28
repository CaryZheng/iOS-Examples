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
    private let onRefresh: () -> Void
    private let content: () -> Content
    
    @State public var showRefreshView: Bool = false
    @State public var pullStatus: CGFloat = 0
    
    public init(title: String, onRefresh: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.onRefresh = onRefresh
        self.content = content
    }
    
    public var body: some View {
        NavigationView {
            RefreshableList(showRefreshView: $showRefreshView, pullStatus: $pullStatus, onRefresh: self.onRefresh) {
                self.content()
            }.navigationBarTitle(title)
        }
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}
