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
	
	static let fontSizeLabelSubTitle: CGFloat = 32
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static func getWidthLabelSubTitle () -> CGFloat{
		return ScreenWith - 16
	}
	
	static func getHeightForCell (heightLabel: CGFloat) -> CGFloat{
		return 8 + 64 - 8 + 21 + 8 + heightLabel + 8 + 16
	}
    
}
