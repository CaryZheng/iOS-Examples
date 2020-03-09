//
//  RoutePath.swift
//  ExampleRouter
//
//  Created by Cary on 2020/3/9.
//  Copyright © 2020 Cary. All rights reserved.
//

import Foundation

enum RoutePath {
    case login(User)
    case register
    
    func getValue() -> String {
        var result = ""
        
        switch self {
        case .login(_):
            result = "LoginViewController"
        case .register:
            result = "RegisterViewController"
        }
        
        return result
    }
    
    static func handleParam(routePath: RoutePath, routerPage: IRouterPage) {
        switch routePath {
        case .login(let user):
            routerPage.initWithParams(user)
        case .register:
            break
        }
    }
}
