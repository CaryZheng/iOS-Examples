//
//  DataManager.swift
//  Example-PropertyWrapper
//
//  Created by Cary on 2019/12/24.
//  Copyright © 2019 Cary. All rights reserved.
//

import Foundation

class DataManager {
        
    @MyUserDefault(key: "username", defaultValue: "")
    static var username: String
    
}
