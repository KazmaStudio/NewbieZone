//
//  TableViewCellPreviewCellTypeA.swift
//  NewbieZone
//
//  Created by zhaochenjun on 16/6/17.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewCellPreviewCellTypeA: UITableViewCell {

    @IBOutlet weak var labelReadCount: UILabel!
    @IBOutlet weak var imageViewContent: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
