//
//  GetItunesSongQuery.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import RxSwift

final class GetItunesSongQuery: GetItunesSongQueryProtocol {
    
    private let networkClient: NetworkClient<ItunesSongOverviewDTO>
    private let endPoint = EndPoint(urlString: "/search", host: .itunes)
    
    public init(networkClient: NetworkClient<ItunesSongOverviewDTO>) {
        self.networkClient = networkClient
    }
    
    public func run(searchString: String) -> Observable<[ItunesSongEntity]> {
        let params = ["term": searchString]
        return networkClient.get(at: endPoint, headers: nil, parameters: params)
            .map({ overviewDTO in
                overviewDTO.songs.map({ dto in
                    ItunesSongEntity(with: dto)
                })
            })
    }
}
