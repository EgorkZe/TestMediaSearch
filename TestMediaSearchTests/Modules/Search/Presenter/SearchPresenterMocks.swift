//
//  SearchPresenterMocks.swift
//  TestMediaSearchTests
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//
import RxSwift

@testable import TestMediaSearch

extension SearchPresenterTest {
    
    class MockSearchView: SearchViewInput {
        
        var localizeCalled = false
        var updateCalled = false
        var selectTabCalled = false
        
        func localize(with viewLocalization: SearchViewLocalization) {
            localizeCalled = true
        }
        
        func update(section: ListSection) {
            updateCalled = true
        }
        
        func selectTab(tab: SegmentedTabs) {
            selectTabCalled = true
        }
    }
    
    class MockGithubRepository: GithubRepositoryProtocol {
        
        var getGithubUsersCalled = false
        
        func getGithubUsers(searchString: String) -> Observable<[GithubUserEntity]> {
            getGithubUsersCalled = true
            return Observable.just([])
        }
    }
    
    class MockItunesRepository: ItunesRepositoryProtocol {
        
        var getItunesSongsCalled = false
        
        func getItunesSongs(searchString: String) -> Observable<[ItunesSongEntity]> {
            getItunesSongsCalled = true
            return Observable.just([])
        }
    }
    
    class MockSearchViewModelBuilder: SearchViewModelBuilderProtocol {
        
        var buildSectionsForGithubUsersCalled = false
        var buildSectionsForItunesCalled = false
        
        func buildSectionsForGithubUsers(users: [GithubUserEntity]) -> ListSection {
            buildSectionsForGithubUsersCalled = true
            return ListSection(header: nil, footer: nil, viewModels: [])
        }
        
        func buildSectionsForItunes(songs: [ItunesSongEntity]) -> ListSection {
            buildSectionsForItunesCalled = true
            return ListSection(header: nil, footer: nil, viewModels: [])
        }
    }
}
