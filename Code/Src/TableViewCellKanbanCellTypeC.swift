//
//  TableViewCellKanbanCellTypeC.swift
//  NewbieZone
//
//  Created by ZHAOCHENJUN on 16/6/14.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewCellKanbanCellTypeC: UITableViewCell {

	@IBOutlet var heightViewImage: NSLayoutConstraint!
	
	@IBOutlet var labelContent: UILabel!
	
	static let fontSizeLabelSubTitle: CGFloat = 14
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static func getWidthLabelContent () -> CGFloat{
		return ScreenWith - 16
	}
	
	static func getWidthViewImageContent () -> CGFloat{
		return ScreenWith - 16
	}
	
	static func getHeightForCell (heightLaeblContent: CGFloat) -> CGFloat{
		return 16 + heightLaeblContent + 16 + 8
	}
    
}
