//
//  TableViewCellKanbanCellTypeB.swift
//  NewbieZone
//
//  Created by zhaochenjun on 16/5/31.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewCellKanbanCellTypeB: UITableViewCell {
    @IBOutlet weak var lableTitle: UILabel!

    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
