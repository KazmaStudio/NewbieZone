//
//  TableViewCellKanbanCellTypeA.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/23.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewCellKanbanCellTypeA: UITableViewCell {

    @IBOutlet weak var imageKanbanContent: UIImageView!
    @IBOutlet weak var imageKanbanBG: UIImageView!
    @IBOutlet weak var labelImageCount: UILabel!
    @IBOutlet weak var imageKanbanContentHeight: NSLayoutConstraint!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let blurEffectLight = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let imageKanbanBGBlurViewLight = UIVisualEffectView(effect: blurEffectLight)
        imageKanbanBGBlurViewLight.frame = CGRectMake(0, 0, ScreenWith, ScreenWith + 56.0)
        imageKanbanBG.addSubview(imageKanbanBGBlurViewLight)
        
        // Initialization code
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static func getHeightForCell (sizeImage : CGSize) -> CGFloat{

		let imageWidth: CGFloat = sizeImage.width
		let rate:CGFloat = ScreenWith / imageWidth
		return (sizeImage.height) * rate + 40

	}
    
}
