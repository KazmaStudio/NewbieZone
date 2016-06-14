//
//  ModelKanban.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/29.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

class ModelKanban: NSObject {
    
    var kanbanUserInfo:ModelUser!
    var kanbanDateTime:String!
    var kanbanTitleText:String?
    var kanbanSubTitleText:String?
    var kanbanContentText:String?
    var kanbanContentImage:Array<ModelImage>?
    var kanbanEroEmoji:Array<String>?
	var kanbanType: KanbanType = .TypeA
    var kanbanHasDetail:Bool!
	
	enum KanbanType {
		case TypeA
		case TypeB
		case TypeC
		case TypeD
	}
	
}
