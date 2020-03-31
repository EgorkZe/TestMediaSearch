//
//  ListItemViewModel.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit

public protocol ListItemDelegatable: class { }

public protocol ListItem {
    
    static var identifier: String { get }
    
    func configure(with viewModel: ListItemViewModel, delegate: ListItemDelegatable?)
}

public protocol ListStaticItem: ListItem {
    
    static var listItemHeight: CGFloat { get }
}

public extension ListItem {
    
    static var identifier: String {
        return String(describing: self)
    }
}

public protocol ListItemViewModel {
    
    static var associatedListItem: ListItem.Type { get }
    var tag: String? { get }
    var hashString: String { get }
}

extension ListItemViewModel {
    
    var identifier: String {
        return type(of: self).associatedListItem.identifier
    }
    
    public var tag: String? {
        get {
            return nil
        }
    }
    
    public var hashString: String {
        get {
            var hash = ""
            let children = Mirror(reflecting: self).children
            
            children.forEach { (child) in
                let key = child.label ?? ""
                let value = (child.value as? String) ?? ""
                hash += "\(key)-\(value)"
            }
            return "\(hash.hashValue)"
        }
    }
}
