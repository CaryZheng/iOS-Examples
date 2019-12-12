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
        print("View 1 hitTest")
        
        return super.hitTest(point, with: event)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("View 1 touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("View 1 touchesMoved")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("View 1 touchesCancelled")
    }
}
