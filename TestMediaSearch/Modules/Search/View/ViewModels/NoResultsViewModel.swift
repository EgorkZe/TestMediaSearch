//
//  NoResultsViewModel.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct NoResultsViewModel: ListItemViewModel {
    
    public static var associatedListItem: ListItem.Type = NoResultsCell.self
    
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
}
