//
//  ToppingTableViewCell.swift
//  top-it
//
//  Created by Gregory Ziegan on 11/11/14.
//  Copyright (c) 2014 Greg Ziegan. All rights reserved.
//

import UIKit

class ToppingTableViewCell: UITableViewCell {

    @IBOutlet weak var toppingName: UILabel!
    
    @IBOutlet weak var toppingSelection: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
