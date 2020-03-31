//
//  SearchViewModelBuilder.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

final public class SearchViewModelBuilder: SearchViewModelBuilderProtocol {
    
    private func isEven(value: Int) -> Bool {
        return value % 2 == 0
    }
    
    // MARK: GithubUsers viewmodels builder
    
    func buildSectionsForGithubUsers(users: [GithubUserEntity]) -> ListSection {
        if users.isEmpty {
            return ListSection(header: nil, footer: nil, viewModels: [NoResultsViewModel(title: NSLocalizedString("noresults.title", comment: ""))])
        }
        var viewModels: [ListItemViewModel] = []
        for (index, entity) in users.enumerated() {
            let viewModel: ListItemViewModel = isEven(value: index) ?
                LeftImageRightTextViewModel(title: entity.username, image: entity.avatarUrl, subtitle: entity.linkToRepo) :
                RightImageLeftTextViewModel(title: entity.username, image: entity.avatarUrl, subtitle: entity.linkToRepo)
            viewModels.append(viewModel)
        }
        return ListSection(header: nil, footer: nil, viewModels: viewModels)
    }
    
    // MARK: Itunes viewmodels builder
    
    func buildSectionsForItunes(songs: [ItunesSongEntity]) -> ListSection {
        if songs.isEmpty {
            return ListSection(header: nil, footer: nil, viewModels: [NoResultsViewModel(title: NSLocalizedString("noresults.title", comment: ""))])
        }
        var viewModels: [ListItemViewModel] = []
        for (index, entity) in songs.enumerated() {
            let viewModel: ListItemViewModel = isEven(value: index) ?
                RightImageLeftTextViewModel(title: entity.title, image: entity.iconUrl, subtitle: entity.artistName) :
                LeftImageRightTextViewModel(title: entity.title, image: entity.iconUrl, subtitle: entity.artistName)
                viewModels.append(viewModel)
        }
        return ListSection(header: nil, footer: nil, viewModels: viewModels)
    }
}
