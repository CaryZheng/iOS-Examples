//
//  MyUserDefault.swift
//  Example-PropertyWrapper
//
//  Created by Cary on 2019/12/24.
//  Copyright © 2019 Cary. All rights reserved.
//

import Foundation

@propertyWrapper
struct MyUserDefault<T> {
    
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            return (UserDefaults.standard.object(forKey: key) as? T) ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
}
