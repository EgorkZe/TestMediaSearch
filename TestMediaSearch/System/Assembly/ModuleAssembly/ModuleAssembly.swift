//
//  ModuleAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

final class ModuleAssembly: BaseAssembly {
    
    static func configure() {
        SearchAssembly.configure()
    }
}
