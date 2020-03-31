//
//  BaseAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol BaseAssembly {
    static func configure()
}

extension BaseAssembly {
    
    static func resolve<Service>(type: Service.Type) -> Service? {
        return defaultContainer().resolve(type)
    }
    
    static func resolve<Service>(type: Service.Type, argument: String) -> Service? {
        return defaultContainer().resolve(type, argument: argument)
    }
    
    static func resolve<Service>(type: Service.Type, name: String) -> Service? {
        return defaultContainer().resolve(type, name: name)
    }
    
    static func resolve<Service>(type: Service.Type, name: String, argument: String) -> Service? {
        return defaultContainer().resolve(type, name: name, argument: argument)
    }
    
    static func defaultContainer() -> Container {
        return (UIApplication.shared.delegate as? AppDelegate)?.container ?? Container()
    }
}
