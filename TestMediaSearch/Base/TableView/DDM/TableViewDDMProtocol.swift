//
//  TableViewDDMProtocol.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit

public protocol TableViewDDMProtocol: UITableViewDataSource, UITableViewDelegate {
    
    var delegate: TableViewDDMDelegate? { get set }
    
    func getSections() -> [ListSection]
    func update(with sections: [ListSection])
    func insert(sections: [ListSection])
    
    func dataSourceForTableView() -> UITableViewDataSource
    func delegateForTableView() -> UITableViewDelegate
}

extension TableViewDDMProtocol {
    
    public func dataSourceForTableView() -> UITableViewDataSource {
        return self
    }
    
    public func delegateForTableView() -> UITableViewDelegate {
        return self
    }
}
