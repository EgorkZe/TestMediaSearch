//
//  LeftImageRightTextViewModel.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public struct LeftImageRightTextViewModel: ListItemViewModel {
    
    public static var associatedListItem: ListItem.Type = LeftImageRightTextCell.self
    
    public let title: String
    public let subtitle: String
    public let image: String
    
    public init(title: String, image: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
