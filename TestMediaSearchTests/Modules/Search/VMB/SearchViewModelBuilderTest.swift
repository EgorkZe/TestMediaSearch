//
//  SearchViewModelBuilderTest.swift
//  TestMediaSearchTests
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import XCTest

@testable import TestMediaSearch

class SearchViewModelBuilderTest: XCTestCase {
    
    let viewModelBuilder = SearchViewModelBuilder()
    let mockGithubUserEntity = GithubUserEntity(with: (mockGithubUsers.users.first)!)
    let mockItunesItemEntity = ItunesSongEntity(with: (mockItunes.songs.first)!)

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateGithubUsersSections_ShouldCreateCorrect() {
        //given
        let mockModelsArray = [mockGithubUserEntity, mockGithubUserEntity]
        
        //when
        let sections = viewModelBuilder.buildSectionsForGithubUsers(users: mockModelsArray)
        
        //then
        XCTAssertTrue(!sections.isEmpty, "Returned wrong amount")
    }
    
    func testCreateGithubUsersSections_ShouldCreateCorrectModelsNumber() {
        //given
        let mockModelsArray = [mockGithubUserEntity, mockGithubUserEntity]
        
        //when
        let section = viewModelBuilder.buildSectionsForGithubUsers(users: mockModelsArray)
        
        //then
        XCTAssertNil(section.header, "Returned wrong header")
        XCTAssertNil(section.footer, "Returned wrong footer")
        XCTAssertEqual(section.viewModels.count, 2, "Returned wrong amount of viewModels")
    }
    
    func testCreateItunesSections_ShouldCreateCorrect() {
        //given
        let mockModelsArray = [mockItunesItemEntity, mockItunesItemEntity]
        
        //when
        let sections = viewModelBuilder.buildSectionsForItunes(songs: mockModelsArray)
        
        //then
        XCTAssertTrue(!sections.isEmpty, "Returned wrong amount")
    }
    
    func testCreateItunesSections_ShouldCreateCorrectModelsNumber() {
        //given
        let mockModelsArray = [mockItunesItemEntity, mockItunesItemEntity]
        
        //when
        let section = viewModelBuilder.buildSectionsForItunes(songs: mockModelsArray)
        
        //then
        XCTAssertNil(section.header, "Returned wrong header")
        XCTAssertNil(section.footer, "Returned wrong footer")
        XCTAssertEqual(section.viewModels.count, 2, "Returned wrong amount of viewModels")
    }
    
    func testNoItunesSongsFound_ShouldCreateOneModelNumber() {
        //given
        let mockModelsArray: [ItunesSongEntity] = []
        
        //when
        let section = viewModelBuilder.buildSectionsForItunes(songs: mockModelsArray)
        
        //then
        XCTAssertNil(section.header, "Returned wrong header")
        XCTAssertNil(section.footer, "Returned wrong footer")
        XCTAssertEqual(section.viewModels.count, 1, "Returned wrong amount of viewModels")
    }
    
    func testNoGithubUsersFound_ShouldCreateOneModelNumber() {
        //given
        let mockModelsArray: [GithubUserEntity] = []
        
        //when
        let section = viewModelBuilder.buildSectionsForGithubUsers(users: mockModelsArray)
        
        //then
        XCTAssertNil(section.header, "Returned wrong header")
        XCTAssertNil(section.footer, "Returned wrong footer")
        XCTAssertEqual(section.viewModels.count, 1, "Returned wrong amount of viewModels")
    }
}
