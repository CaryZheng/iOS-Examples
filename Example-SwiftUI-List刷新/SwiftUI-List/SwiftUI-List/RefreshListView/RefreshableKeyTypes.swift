//
//  RefreshableKeyTypes.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/25.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

struct RefreshableKeyTypes {
    
    struct PrefData: Equatable {
        let bounds: CGRect
    }

    struct PrefKey: PreferenceKey {
        static var defaultValue: [PrefData] = []

        static func reduce(value: inout [PrefData], nextValue: () -> [PrefData]) {
            value.append(contentsOf: nextValue())
        }

        typealias Value = [PrefData]
    }
}
