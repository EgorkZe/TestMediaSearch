//
//  NetworkClient.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

final public class NetworkClient<T: Mappable> {

    let parser: Parser = Parser<T>()
    
    public init() {
        URLCache.shared.diskCapacity = 0
    }
    
    public func get(at endPoint: EndPoint,
                    headers: [String: String]? ,
                    parameters: [String: Any]?) -> Observable<T> {
        return requestData(method: .get, endPoint: endPoint, headers: headers, parameters: parameters)
    }
    
    private func requestData(method: HTTPMethod,
                                       endPoint: EndPoint,
                                       headers: [String: String]?,
                                       parameters: [String: Any]?) -> Observable<T> {
        return request(method: method, endPoint: endPoint, headers: headers, parameters: parameters)
    }
    
    public func responseHandling(_ response: HTTPURLResponse, json: Any) -> Observable<T> {
        #if DEBUG
        print("✅ RESPONSE:\n")
        debugPrint(response)
        debugPrint(json)
        #endif
        
        return self.parser.parse(json)
    }
    
    private func buildUrlString(given endpoint: EndPoint) -> String {
        let baseUrl = endpoint.host.rawValue
        return baseUrl + endpoint.urlString
    }
    
    private func request(method: HTTPMethod,
                         endPoint: EndPoint,
                         headers: [String: String]?,
                         parameters: [String: Any]?) -> Observable<T> {
        return Observable.deferred({ () -> Observable<T> in
            
            let errorStructure = ErrorStructure(message: "Problems",
                                                code: 0)
            let url = self.buildUrlString(given: endPoint)
            
            #if DEBUG
            print("❓❓❓ \(method.rawValue) REQUEST:\n")
            debugPrint(url)
            debugPrint(parameters as Any)
            #endif
            let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
            return RxAlamofire.requestJSON(method, url, parameters: parameters, encoding: encoding, headers: nil)
                .catchError({ (error) -> Observable<(HTTPURLResponse, Any)> in
                    if error is AFError {
                        return Observable.error(errorStructure)
                    }
                    
                    return Observable.error(errorStructure)
                })
                .flatMap({ (response, json) -> Observable<T> in
                    return self.responseHandling(response, json: json)
                })
                .do(
                    onError: { error in
                        if let customError = error as? ErrorStructure {
                            print(customError)
                        }
                })
        })
    }
}
