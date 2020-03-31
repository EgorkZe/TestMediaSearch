//
//  TableViewRegistrator.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import UIKit

public class TableViewRegistrator {
    
    public enum TableObjectType {
        case cell
        case headerFooter
    }
    
    private weak var tableView: UITableView?
    private var registeredIds: Set<String> = []
    
    public init(tableView: UITableView?) {
        self.tableView = tableView
    }
    
    func register(withReuseIdentifier reuseIdentifier: String, forType type: TableObjectType) {
        if registeredIds.contains(reuseIdentifier) {
            return
        }
        
        var isImplementedInStoryboard = false
        
        switch type {
        case .cell:
            isImplementedInStoryboard = tableView?.dequeueReusableCell(withIdentifier: reuseIdentifier) != nil
        case .headerFooter:
            isImplementedInStoryboard = tableView?.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) != nil
        }
        
        if isImplementedInStoryboard {
            registeredIds.insert(reuseIdentifier)
            return
        }

        let bundle = Bundle(for: TableViewRegistrator.self)
        guard let _ = bundle.path(forResource: reuseIdentifier, ofType: "nib") else {
            return
        }
        let nib = UINib(nibName: reuseIdentifier, bundle: bundle)
        switch type {
        case .cell:
            tableView?.register(nib, forCellReuseIdentifier: reuseIdentifier)
        case .headerFooter:
            tableView?.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
        }
        registeredIds.insert(reuseIdentifier)
    }
}
