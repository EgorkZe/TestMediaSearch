//
//  RightImageLeftTextCell.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit

final class RightImageLeftTextCell: UITableViewCell, NibReusable, ListItem {
    
    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var titlePlace: UILabel!
    @IBOutlet weak var subtitlePlace: UILabel!
    
    func configure(with viewModel: ListItemViewModel, delegate: ListItemDelegatable?) {
        guard let vm = viewModel as? RightImageLeftTextViewModel else{
            return
        }
        
        imagePlace.image = nil
        if let url = URL(string: vm.image) {
            imagePlace.load(url: url)
        }
        titlePlace.text = vm.title
        subtitlePlace.text = vm.subtitle
    }
}
