//
//  ItunesSongDTO.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ItunesSongDTO {
    
    public var iconUrl: String?
    public var artistName: String?
    public var title: String?
    
    public init() {
        
    }
}
extension ItunesSongDTO: Mappable {
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        iconUrl <- map["artworkUrl100"]
        artistName <- map["artistName"]
        title <- map["collectionName"]
    }
}

public struct ItunesSongOverviewDTO {
    
    public var songs: [ItunesSongDTO] = []
}

// MARK: - Mappable
extension ItunesSongOverviewDTO: Mappable {
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        songs <- map["results"]
    }
}
