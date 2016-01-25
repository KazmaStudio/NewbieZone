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
    @IBOutlet weak var imageKanbanContentHeight: NSLayoutConstraint!
    
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
    
}
