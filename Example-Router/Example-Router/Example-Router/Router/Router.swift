//
//  Router.swift
//  Example-Router
//
//  Created by Cary on 2020/3/3.
//  Copyright © 2020 Cary. All rights reserved.
//

import UIKit
import SafariServices

class Router {
    
    static func open(path: RoutePath, fromVC: UIViewController) {
        open(path: path, fromVC: fromVC, urlLink: nil)
    }
    
    static func open(urlLink: String, fromVC: UIViewController) {
        open(path: nil, fromVC: fromVC, urlLink: urlLink)
    }
    
    private static func open(path: RoutePath?, fromVC: UIViewController, urlLink: String?) {
        if let urlLink = urlLink, !urlLink.isEmpty {
            // web
            openWebPage(urlLink: urlLink, fromVC: fromVC)
            return
        }
        
        guard let path = path else {
            return
        }
        
        let appName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let className = appName + "." + path.getValue()
        if let targetClass: UIViewController.Type = NSClassFromString(className) as? UIViewController.Type {
            let targetInstance = targetClass.init()
            
            if let routerPage = targetInstance as? IRouterPage {
                RoutePath.handleParam(routePath: path, routerPage: routerPage)
            }
            
            fromVC.navigationController?.pushViewController(targetInstance, animated: true)
        }
    }
    
    private static func openWebPage(urlLink: String, fromVC: UIViewController) {
        guard let url = URL(string: urlLink) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        
        fromVC.navigationController?.pushViewController(safariVC, animated: true)
    }
}

