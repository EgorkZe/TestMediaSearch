//
//  TableViewDDM.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import UIKit

// MARK: - TableViewDDM

final public class TableViewDDM: NSObject, TableViewDDMProtocol {
    
    fileprivate var sections: [ListSection] = []
    
    weak public var delegate: TableViewDDMDelegate?
    
    public func getSections() -> [ListSection] {
        return sections
    }
    
    public func update(with sections: [ListSection]) {
        self.sections = sections
    }
    
    public func insert(sections: [ListSection]) {
        self.sections.append(contentsOf: sections)
    }
    
    fileprivate func registerListItem(withIdentifier identifier: String, type: TableViewRegistrator.TableObjectType, tableView: UITableView) {
        if let tableView = tableView as? TableView {
            tableView.registrator.register(withReuseIdentifier: identifier, forType: type)
        }
    }
}

// MARK: - UITableViewDataSource

extension TableViewDDM: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].viewModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sections[indexPath.section].viewModels[indexPath.row]
        registerListItem(withIdentifier: viewModel.identifier, type: .cell, tableView: tableView)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifier) as! ListItem
        cell.configure(with: viewModel, delegate: delegate)
        return cell as! UITableViewCell
    }
}

// MARK: - UITableViewDelegate

extension TableViewDDM: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = sections[indexPath.section].viewModels[indexPath.row]
        if let cell = type(of: viewModel).associatedListItem as? ListStaticItem.Type {
            return cell.listItemHeight
        }
        return UITableViewAutomaticDimension
    }
    
    // MARK: Header Section
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let viewModel = sections[section].header else {
            return CGFloat.leastNormalMagnitude
        }
        guard let modelType = type(of: viewModel).associatedListItem as? ListStaticItem.Type else {
            return UITableViewAutomaticDimension
        }
        return modelType.listItemHeight
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = sections[section].header else {
            return nil
        }
        
        registerListItem(withIdentifier: viewModel.identifier, type: .headerFooter, tableView: tableView)
        
        let listItem = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewModel.identifier) as? ListItem
        listItem?.configure(with: viewModel, delegate: delegate)
        return listItem as? UIView
    }
    
    // MARK: Footer Section
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let viewModel = sections[section].footer else {
            return CGFloat.leastNormalMagnitude
        }
        guard let modelType = type(of: viewModel).associatedListItem as? ListStaticItem.Type else {
            return UITableViewAutomaticDimension
        }
        return modelType.listItemHeight
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let viewModel = sections[section].footer else {
            return nil
        }
        
        registerListItem(withIdentifier: viewModel.identifier, type: .headerFooter, tableView: tableView)
        
        let listItem = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewModel.identifier) as? ListItem
        listItem?.configure(with: viewModel, delegate: delegate)
        return listItem as? UIView
    }
}
