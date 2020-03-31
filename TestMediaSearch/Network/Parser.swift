//
//  Parser.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import ObjectMapper

public final class Parser<T: Mappable> {
    
    public func parse(_ response: Any) -> Observable<T> {
        if let parsed = Mapper<T>().map(JSONObject: response) {
            return Observable.just(parsed)
        }
        if response is NSArray, let dict = ["array": response].toJSONString(), let parsed = Mapper<T>().map(JSONString: dict) {
            return Observable.just(parsed)
        }
        let errorStructure = ErrorStructure(message: "Problem with parsing",
                       code: 0)
        return Observable.error(errorStructure)
    }
}
