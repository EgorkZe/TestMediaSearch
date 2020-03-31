//
//  SearchViewInput.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct SearchViewLocalization {
    
    let segmentTitles: [String]
    
    public init(segmentTitles: [String]) {
        self.segmentTitles = segmentTitles
    }
}

public protocol SearchViewInput {
    
    func localize(with viewLocalization: SearchViewLocalization)
    func update(section: ListSection)
    func selectTab(tab: SegmentedTabs)
}
