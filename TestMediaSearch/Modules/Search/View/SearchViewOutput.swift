//
//  SearchViewOutput.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public enum SegmentedTabs: Int {
    case github
    case itunes
    
    static let allValues = [github, itunes]
    
    var description: String {
        switch self {
        case .github:
            return NSLocalizedString("github.title", comment: "")
        case .itunes:
            return NSLocalizedString("itunes.title", comment: "")
        }
    }
}

public protocol SearchViewOutput {
    
    func viewIsReady()
    func segmentChanged(to index: SegmentedTabs)
    func searchStringChanged(to string: String)
}
