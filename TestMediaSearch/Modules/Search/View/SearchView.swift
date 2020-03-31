//
//  SearchScreen.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit

final public class SearchView: UIViewController, SearchViewInput, UISearchBarDelegate {
    
    public var output: SearchViewOutput!
    
    @IBOutlet weak var tableView: TableView!
    public var ddm: TableViewDDMProtocol!
    private var segment: UISegmentedControl = UISegmentedControl(items: nil)
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupTableRepresentation()
        setDefualtDDM()
        output.viewIsReady()
        configureSegmentView()
    }
    
    public func localize(with viewLocalization: SearchViewLocalization) {
        for (index, item) in viewLocalization.segmentTitles.enumerated() {
            segment.insertSegment(withTitle: item, at: index, animated: false)
        }
    }
    
    public func selectTab(tab: SegmentedTabs) {
        segment.selectedSegmentIndex = tab.rawValue
        segment.sendActions(for: .valueChanged)
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output.searchStringChanged(to: searchText)
    }
    
    public func update(section: ListSection) {
        ddm.update(with: [section])
        tableView.reloadData()
    }
    
    public func setDefualtDDM() {
        let ddm = TableViewDDM()
        setDDM(ddm)
    }
    
    public func setDDM(_ ddm: TableViewDDMProtocol) {
        self.ddm = ddm
        tableView.dataSource = ddm.dataSourceForTableView()
        tableView.delegate = ddm.delegateForTableView()
    }
    
    @objc func segmentSwitched(_ sender: UISegmentedControl) {
        guard let selectedTab = SegmentedTabs(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        scrollTableViewToTop()
        output.segmentChanged(to: selectedTab)
    }
    
    private func configureSegmentView() {
        segment.sizeToFit()
        self.navigationItem.titleView = segment
        segment.addTarget(self, action: #selector(segmentSwitched(_:)), for: .valueChanged)
    }
    
    private func scrollTableViewToTop() {
        self.tableView.setContentOffset(.zero, animated: false)
    }
    
    private func setupTableRepresentation() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.estimatedSectionHeaderHeight = 200.0
        tableView.estimatedSectionFooterHeight = 200.0
        tableView.tableFooterView = UIView()
    }
}
