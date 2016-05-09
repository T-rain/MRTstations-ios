//
//  CustomCell.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/9.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var StationName: UILabel!
    @IBOutlet weak var lineOne: UILabel!
    @IBOutlet weak var lineTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
