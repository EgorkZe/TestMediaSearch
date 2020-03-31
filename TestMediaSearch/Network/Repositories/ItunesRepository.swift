//
//  ItunesRepository.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import RxSwift

final class ItunesRepository: ItunesRepositoryProtocol {
   
    var gitItunesQuery: GetItunesSongQueryProtocol!
    
    func getItunesSongs(searchString: String) -> Observable<[ItunesSongEntity]> {
        return gitItunesQuery.run(searchString: searchString)
    }
}
