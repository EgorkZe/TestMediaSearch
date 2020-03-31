//
//  SearchScreenPresenter.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import RxSwift

final public class SearchPresenter: SearchViewOutput {
    
    public var view: SearchViewInput!
    var githubRepository: GithubRepositoryProtocol!
    var itunesRepository: ItunesRepositoryProtocol!
    
    var searchVMBuilder: SearchViewModelBuilderProtocol!
    
    private var disposeBag = DisposeBag()
    
    private var searchString = ""
    private var currentTab: SegmentedTabs = .github
    
    public func viewIsReady() {
        let titles = SegmentedTabs.allValues.map { $0.description}
        let localization = SearchViewLocalization(segmentTitles: titles)
        view.localize(with: localization)
        view.selectTab(tab: .github)
    }
    
    public func segmentChanged(to index: SegmentedTabs) {
        currentTab = index
        getNewData()
    }
    
    public func searchStringChanged(to string: String) {
        searchString = string
        getNewData()
    }
    
    private func getNewData() {
        switch currentTab {
        case .github:
            searchGithubUsers(with: searchString)
        case.itunes:
            searchItunes(with: searchString)
        }
    }
    
    private func searchGithubUsers(with searchString: String) {
        githubRepository.getGithubUsers(searchString: searchString).subscribe(onNext: { (users) in
            let section = self.searchVMBuilder.buildSectionsForGithubUsers(users: users)
            self.view.update(section: section)
        }).disposed(by: disposeBag)
    }
    
    private func searchItunes(with searchString: String) {
        itunesRepository.getItunesSongs(searchString: searchString).subscribe(onNext: { (songs) in
            let section = self.searchVMBuilder.buildSectionsForItunes(songs: songs)
            self.view.update(section: section)
        }).disposed(by: disposeBag)
    }
}
