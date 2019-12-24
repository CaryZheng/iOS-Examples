//
//  DataManager.swift
//  Example-PropertyWrapper
//
//  Created by Cary on 2019/12/24.
//  Copyright © 2019 Cary. All rights reserved.
//

import Foundation

class DataManager {
    
    private static var mInstance: DataManager!
    
    @MyUserDefault(key: "username", defaultValue: "")
    var username: String
    
    static func getInstance() -> DataManager {
        if nil == mInstance {
            mInstance = DataManager()
        }
        
        return mInstance
    }
    
    func setUsername(value: String) {
        username = value
    }
    
    func getUsername() -> String {
        return username
    }
    
}
