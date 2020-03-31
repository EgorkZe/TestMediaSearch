//
//  ApplicationAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import Swinject

final class ApplicationAssembly: BaseAssembly {
    
    static func configure() {
        
        let container = defaultContainer()

        container.register(AppStarterProtocol.self) { resolver in
            let appStarter = AppStarter()
            return appStarter
        }
    }
}
