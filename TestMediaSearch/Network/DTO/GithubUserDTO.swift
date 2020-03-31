//
//  GithubDTO.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import ObjectMapper

public struct GithubUserDTO {
    
    public var avatarUrl: String?
    public var username: String?
    public var linkToRepo: String?
    
    public init() {
        
    }
}
extension GithubUserDTO: Mappable {
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        username <- map["login"]
        avatarUrl <- map["avatar_url"]
        linkToRepo <- map["html_url"]
    }
}

public struct GithubUsersOverviewDTO {
    
    public var users: [GithubUserDTO] = []
}

// MARK: - Mappable
extension GithubUsersOverviewDTO: Mappable {
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        users <- map["items"]
    }
}
