//
//  ReoisitoryAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

final class RepositoryAssembly: BaseAssembly {
    
    static func configure() {
        
        let container = defaultContainer()
        
        container.register(GithubRepositoryProtocol.self) { resolver in
            let repository = GithubRepository()
            repository.gitHubUsersQuery = resolver.resolve(GetGithubUsersQueryProtocol.self)!
            return repository
        }.inObjectScope(.container)
        
        container.register(ItunesRepositoryProtocol.self) { resolver in
            let repository = ItunesRepository()
            repository.gitItunesQuery = resolver.resolve(GetItunesSongQueryProtocol.self)!
            return repository
        }.inObjectScope(.container)
    }
}
