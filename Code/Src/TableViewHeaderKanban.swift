//
//  TableViewHeaderKanban.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/30.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewHeaderKanban: UITableViewHeaderFooterView {

    @IBOutlet weak var viewUserInfo: UIView!
    
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var imageAvatar: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelSub: UILabel!
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let blurEffectLight = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let imageKanbanBGBlurViewLight = UIVisualEffectView(effect: blurEffectLight)
        imageKanbanBGBlurViewLight.frame = CGRectMake(0, 0, ScreenWith, 56.0)
        viewBG.addSubview(imageKanbanBGBlurViewLight)
        
        viewBG.bringSubviewToFront(viewUserInfo)
    }
    
}
