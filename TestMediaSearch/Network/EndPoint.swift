//
//  EndPoint.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct EndPoint {
    public let urlString: String
    public let host: Hosts
}

public enum Hosts: String {
    case itunes = "https://itunes.apple.com"
    case github = "https://api.github.com"
}
