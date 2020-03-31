//
//  TTableSection.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

public protocol ListSectionProtocol {
    
    var header: ListItemViewModel? { get set }
    var footer: ListItemViewModel? { get set }
    var viewModels: [ListItemViewModel] { get set }
}

public struct ListSection: ListSectionProtocol, Equatable, Collection {
    
    public static func == (lhs: ListSection, rhs: ListSection) -> Bool {
        return lhs.id == rhs.id
    }
    
    let elements: [ListItemViewModel]
    
    public typealias Index = Int
    
    public var startIndex: Int {
        return elements.startIndex
    }
    
    public var endIndex: Int {
        return elements.endIndex
    }
    
    public subscript(i: Int) -> String {
        return elements[i].hashString
    }
    
    public func index(after i: Int) -> Int {
        return elements.index(after: i)
    }
    
    public let id: Int
    public var header: ListItemViewModel?
    public var footer: ListItemViewModel?
    public var viewModels: [ListItemViewModel]
    
    public init(header: ListItemViewModel?, footer: ListItemViewModel?, viewModels: [ListItemViewModel]) {
        self.header = header
        self.footer = footer
        self.viewModels = viewModels
        self.elements = viewModels
        
        var calculatedId = ""
        
        if header != nil {
            calculatedId += header?.hashString ?? ""
        }
        
        if footer != nil {
            calculatedId += footer?.hashString ?? ""
        }
        
        self.id = calculatedId.hashValue
    }
    
    static public func empty() -> ListSection {
        return ListSection(header: nil, footer: nil, viewModels: [])
    }
}

// MARK: - Array Extension

public extension Array where Element: ListSectionProtocol {
    mutating func appendSection(_ newSection: Element) {
        if !newSection.viewModels.isEmpty {
            append(newSection)
        }
    }
}
