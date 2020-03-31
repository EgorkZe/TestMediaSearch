//
//  TableView.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 19/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import UIKit

class TableView: UITableView {

    var registrator: TableViewRegistrator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registrator = TableViewRegistrator(tableView: self)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style) 
        registrator = TableViewRegistrator(tableView: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
