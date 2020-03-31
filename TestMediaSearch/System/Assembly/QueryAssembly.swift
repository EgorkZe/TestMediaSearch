//
//  QueryAssembly.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

final class QueryAssembly: BaseAssembly {
    
    static func configure() {
        let container = defaultContainer()
        
        container.register(GetGithubUsersQueryProtocol.self) { _ in
            GetGithubUsersQuery(networkClient: NetworkClient<GithubUsersOverviewDTO>())
        }.inObjectScope(.container)
        
        container.register(GetItunesSongQueryProtocol.self) { _ in
            GetItunesSongQuery(networkClient: NetworkClient<ItunesSongOverviewDTO>())
        }.inObjectScope(.container)
    }
}
