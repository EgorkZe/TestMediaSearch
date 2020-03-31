//
//  ItunesSongEntity.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct ItunesSongEntity {
    
    private let dto: ItunesSongDTO
    
    init(with dto: ItunesSongDTO) {
        self.dto = dto
    }
    
    public var iconUrl: String {
        return dto.iconUrl ?? ""
    }
    
    public var artistName: String {
        return dto.artistName ?? ""
    }
    
    public var title: String {
        return dto.title ?? ""
    }
}
