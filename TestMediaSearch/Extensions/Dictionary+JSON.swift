//
//  Dictionary+JSON.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value: Any {
    
    func toJSONString() -> String? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []),
            let string = String(data: jsonData, encoding: .utf8) else {
                return nil
        }
        return string
    }
}
