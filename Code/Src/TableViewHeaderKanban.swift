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
    
    @IBOutlet weak var imageKanbanBGBlurViewLight: UIVisualEffectView!

    override func drawRect(rect: CGRect) {
        
    }
	
	func setUserInfo(userInfo: ModelUser) {
        
        if (userInfo.userTitle != "新手村NPC"){
            self.labelTitle.textColor = UIColor.lightGrayColor()
        }
		
		self.labelName.text = userInfo.userName
		self.labelTitle.text = userInfo.userTitle!
		
		// userInfo.userAvatar: String = nil
		//self.imageAvatar.image = UIImage.init(named: userInfo.userAvatar!) // crash
		
		// 方法1
		if (userInfo.userAvatar != nil){
			self.imageAvatar.image = UIImage.init(named: userInfo.userAvatar!)
		}
		
		// 方法2
		guard userInfo.userAvatar != nil else{return}
		self.imageAvatar.image = UIImage.init(named: userInfo.userAvatar!)
		
		// 方法3
		_ = userInfo.userAvatar.map{$0}.map{self.imageAvatar.image = UIImage.init(named: $0)}
	}
    
}
