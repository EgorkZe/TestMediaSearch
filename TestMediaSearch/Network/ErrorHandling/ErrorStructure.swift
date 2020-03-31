//
//  ErrorStructure.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 20/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct ErrorStructure: Error {
    
    public typealias LocalizedError = (title: String, message: String)
    
    public var title: String
    public var info: String
    public var code: Int
    public var message: String
    
    private var localizedMessage: String
    
    public var localizedDescription: String {
        return localizedMessage
    }
    
    public init(title: String = "Error", message: String, info: String = "", code: Int) {
        self.title = title
        self.message = message
        self.localizedMessage = message
        self.info = info
        self.code = code
    }
}
