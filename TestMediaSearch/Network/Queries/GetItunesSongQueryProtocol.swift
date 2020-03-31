//
//  GetItunesSongQueryProtocol.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import RxSwift

protocol GetItunesSongQueryProtocol {
    
    func run(searchString: String) -> Observable<[ItunesSongEntity]>
}
