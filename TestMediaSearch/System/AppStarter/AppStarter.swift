//
//  AppStarter.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit

class AppStarter: AppStarterProtocol {
    
    func start(in window: UIWindow?) {
        startApp(in: window)
    }
    
    private func startApp(in window: UIWindow?) {
        let vc = GlobalAssembly.resolve(type: SearchViewInput.self) as! UIViewController
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
