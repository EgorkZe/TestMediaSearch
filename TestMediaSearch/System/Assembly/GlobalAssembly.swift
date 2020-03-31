//
//  GlobalAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

final class GlobalAssembly: BaseAssembly {
    
    static func configure() {
        ApplicationAssembly.configure()
        QueryAssembly.configure()
        RepositoryAssembly.configure()
        ModuleAssembly.configure()
    }
}
