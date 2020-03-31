//
//  GithubUserEntity.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct GithubUserEntity {
    
    private let dto: GithubUserDTO

    init(with dto: GithubUserDTO) {
        self.dto = dto
    }
    
    public var avatarUrl: String {
        return dto.avatarUrl ?? ""
    }
    
    public var username: String {
        return dto.username ?? ""
    }
    
    public var linkToRepo: String {
        return dto.linkToRepo ?? ""
    }
}
