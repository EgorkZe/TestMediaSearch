//
//  NoResultsCell.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation

import Foundation
import UIKit

final class NoResultsCell: UITableViewCell, NibReusable, ListItem {
    
    @IBOutlet weak var noResultsLabel: UILabel!
    func configure(with viewModel: ListItemViewModel, delegate: ListItemDelegatable?) {
        guard let vm = viewModel as? NoResultsViewModel else{
            return
        }
    }
}
