//
//  SearchPresenterTests.swift
//  TestMediaSearchTests
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import RxSwift
import XCTest

@testable import TestMediaSearch

class SearchPresenterTest: XCTestCase {
    
    let presenter = SearchPresenter()
    let mockView = MockSearchView()
    let mockGithubRepository = MockGithubRepository()
    let mockItunesRepository = MockItunesRepository()
    let mockViewModelBuilder = MockSearchViewModelBuilder()
    
    override func setUp() {
        super.setUp()
        presenter.view = mockView
        presenter.githubRepository = mockGithubRepository
        presenter.itunesRepository = mockItunesRepository
        presenter.searchVMBuilder = mockViewModelBuilder
    }
    
    override func tearDown() {
        presenter.view = nil
        presenter.githubRepository = nil
        presenter.itunesRepository = nil
        presenter.searchVMBuilder = nil
        super.tearDown()
    }
    
    func testViewIsReady_WhenSelectTabMethodCalled_ShouldSuccess() {
        // when
        presenter.viewIsReady()
        
        // then
        assertMethodCall(mockView.selectTabCalled)
        assertMethodCall(mockView.localizeCalled)
    }
    
    func testSearchGithubUsers_WhenSearchRepositoryGithubUserMethodCalled_ShouldSuccess() {
        // when
        presenter.searchGithubUsers(with: "string")
        
        //then
        assertMethodCall(mockGithubRepository.getGithubUsersCalled)
        assertMethodCall(mockViewModelBuilder.buildSectionsForGithubUsersCalled)
    }
    
    func testSearchGithubUsers_WhenSearchRepositoryItunesMethodCalled_ShouldSuccess() {
        // when
        presenter.searchItunes(with: "string")
        
        //then
        assertMethodCall(mockItunesRepository.getItunesSongsCalled)
        assertMethodCall(mockViewModelBuilder.buildSectionsForItunesCalled)
    }
    
    func testReceivedNewSearchString_WhenSelectedGithubTab_ShouldCalledGetGithubUsers() {
        // given
        presenter.currentTab = .github
        
        // when
        presenter.searchStringChanged(to: "string")
        
        //then
        assertMethodCall(mockGithubRepository.getGithubUsersCalled)
    }
    
    func testReceivedNewSearchString_WhenSelectedItunesTab_ShouldCalledGetItunes() {
        // given
        presenter.currentTab = .itunes
        
        // when
        presenter.searchStringChanged(to: "string")
        
        //then
        assertMethodCall(mockItunesRepository.getItunesSongsCalled)
    }
    
    func testItunesRepository_WhenRequestItunesSongs_ShouldCalled() {
        //when
        presenter.searchItunes(with: "string")
        
        //then
        assertMethodCall(mockItunesRepository.getItunesSongsCalled)
    }
    
    func testSearchView_WhenSearchItunesSongs_ShouldUpdateCalled() {
        //when
        presenter.searchItunes(with: "string")
        
        //then
        assertMethodCall(mockView.updateCalled)
    }
    
    func testSearchView_WhenSearchGithubUsers_ShouldUpdateCalled() {
        //when
        presenter.searchGithubUsers(with: "string")
        
        //then
        assertMethodCall(mockView.updateCalled)
    }
}
