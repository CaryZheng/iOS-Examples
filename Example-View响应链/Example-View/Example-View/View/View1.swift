//
//  View1.swift
//  Example-View
//
//  Created by Cary on 2019/12/11.
//  Copyright © 2019 Cary. All rights reserved.
//

import UIKit

class View1: UIView {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("View1 hitTest, point = \(point)")
        
        return super.hitTest(point, with: event)
    }
}
