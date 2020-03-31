//
//  SearchViewModelBuilderProtocol.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

protocol SearchViewModelBuilderProtocol {
    
    func buildSectionsForGithubUsers(users: [GithubUserEntity]) -> ListSection
    func buildSectionsForItunes(songs: [ItunesSongEntity]) -> ListSection
}
