//
//  GetGithubUsersQuery.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import RxSwift

final class GetGithubUsersQuery: GetGithubUsersQueryProtocol {
    
    private let networkClient: NetworkClient<GithubUsersOverviewDTO>
    private let endPoint = EndPoint(urlString: "/search/users", host: .github)
    
    public init(networkClient: NetworkClient<GithubUsersOverviewDTO>) {
        self.networkClient = networkClient
    }

    public func run(searchString: String) -> Observable<[GithubUserEntity]> {
        let params = ["q": searchString]
        return networkClient.get(at: endPoint, headers: nil, parameters: params)
            .map({ overviewDTO in
                overviewDTO.users.map({ dto in
                    GithubUserEntity(with: dto)
                })
            })
    }
}
