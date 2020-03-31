//
//  JsonTestHelper.swift
//  TestMediaSearchTests
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

class JSONTestHelper {
    
    static func jsonStringFromFromBundle(bundle: Bundle, name: String, type: String = "json") -> String {
        guard let pathString = bundle.path(forResource: name, ofType: type) else {
            fatalError("\(name).json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: String.Encoding.utf8) else {
            fatalError("Unable to convert CustomerLoginPinSuccessfullResponse.json to String")
        }
        return jsonString
    }
}
