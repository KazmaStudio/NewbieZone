//
//  TableViewControllerKanban.swift
//  newbiezone
//
//  Created by zhaochenjun on 15/12/22.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

import Kingfisher

class TableViewControllerKanban: UITableViewController {
	
	private var kanbanList:Array<ModelKanban> = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationController?.navigationBar.topItem?.title = "村长家门口的看板"
		
		// :[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,nil]
		
		let cellTypeANib = UINib(nibName: "TableViewCellKanbanCellTypeA", bundle: nil)
		self.tableView.registerNib(cellTypeANib, forCellReuseIdentifier: "TableViewCellKanbanCellTypeA")
		
		let cellTypeBNib = UINib(nibName: "TableViewCellKanbanCellTypeB", bundle: nil)
		self.tableView.registerNib(cellTypeBNib, forCellReuseIdentifier: "TableViewCellKanbanCellTypeB")
		
		let cellTypeCNib = UINib(nibName: "TableViewCellKanbanCellTypeC", bundle: nil)
		self.tableView.registerNib(cellTypeCNib, forCellReuseIdentifier: "TableViewCellKanbanCellTypeC")
		
		let cellHeaderNib = UINib(nibName: "TableViewHeaderKanban", bundle: nil)
		self.tableView.registerNib(cellHeaderNib, forHeaderFooterViewReuseIdentifier: "TableViewHeaderKanban")
		
		// MARK: - fake data
		
		let userInfo1 = ModelUser()
		userInfo1.userID = 0
		userInfo1.userName = "手办2333333333"
		userInfo1.userTitle = "新手村NPC"
		userInfo1.userAvatar = "girl.png"
		
		let userInfo2 = ModelUser()
		userInfo2.userID = 1
		userInfo2.userName = "番号姬"
		userInfo2.userTitle = "新手村NPC"
		userInfo2.userAvatar = "avatar2.jpg"
		
		let imageInfo1 = ModelImage()
		imageInfo1.imageName = "GK0.jpg"
		imageInfo1.width = 1200
		imageInfo1.height = 1636
		
		let imageInfo2 = ModelImage()
		imageInfo2.imageName = "GK1.jpg"
		imageInfo2.width = 4000
		imageInfo2.height = 2248
		
		let imageInfo3 = ModelImage()
		imageInfo3.imageName = "GK2.jpg"
		imageInfo3.width = 994
		imageInfo3.height = 1492
        
        let imageInfo4 = ModelImage()
        imageInfo4.imageName = "GK3.jpg"
        imageInfo4.width = 1902
        imageInfo4.height = 1080
        
        let imageInfo5 = ModelImage()
        imageInfo5.imageName = "GK4.jpg"
        imageInfo5.width = 800
        imageInfo5.height = 1200
        
        let imageInfo6 = ModelImage()
        imageInfo6.imageName = "GK5.jpg"
        imageInfo6.width = 2896
        imageInfo6.height = 1816
        
        let imageInfo7 = ModelImage()
        imageInfo7.imageName = "GK6.jpg"
        imageInfo7.width = 1000
        imageInfo7.height = 1398
		
		let kanbanInfo1 = ModelKanban()
		kanbanInfo1.kanbanUserInfo = userInfo1
		kanbanInfo1.kanbanDateTime = "2015/12/28 16:01"
		kanbanInfo1.kanbanTitleText = "踩踩踩踩踩踩踩踩超级计算机计算机世界神经计算机熬枯受淡静安收到了卡登仕"
		kanbanInfo1.kanbanContentImage = [imageInfo1, imageInfo2, imageInfo3]
		kanbanInfo1.kanbanType = .TypeA
		kanbanInfo1.kanbanHasDetail = true
		
		let kanbanInfo2 = ModelKanban()
		kanbanInfo2.kanbanUserInfo = userInfo2
		kanbanInfo2.kanbanDateTime = "2015/12/28 15:23"
		kanbanInfo2.kanbanTitleText = "SOD 051"
		kanbanInfo2.kanbanSubTitleText = "白石茉莉奈"
		kanbanInfo2.kanbanEroEmoji = ["EEK01", "EEK08", "EEK16","EEK02", "EEK18", "EEK09", "EEK12", "EEK07", "EEK14",]
		kanbanInfo2.kanbanType = .TypeB
		kanbanInfo2.kanbanHasDetail = false
		
		let kanbanInfo3 = ModelKanban()
		kanbanInfo3.kanbanUserInfo = userInfo1
		kanbanInfo3.kanbanDateTime = "2015/12/28 16:01"
		kanbanInfo3.kanbanTitleText = "踩踩踩踩踩踩踩踩超级计算机计算机世界神经计算机熬枯受淡静安收到了卡登仕"
		kanbanInfo3.kanbanContentImage = [imageInfo2, imageInfo3]
		kanbanInfo3.kanbanType = .TypeA
		kanbanInfo3.kanbanHasDetail = true
		
		let kanbanInfo4 = ModelKanban()
		kanbanInfo4.kanbanUserInfo = userInfo1
		kanbanInfo4.kanbanDateTime = "2015/12/28 16:01"
		kanbanInfo4.kanbanContentText = "这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式"
		kanbanInfo4.kanbanContentImage = [imageInfo2, imageInfo3]
		kanbanInfo4.kanbanType = .TypeC
		kanbanInfo4.kanbanHasDetail = true
        
        let kanbanInfo5 = ModelKanban()
        kanbanInfo5.kanbanUserInfo = userInfo1
        kanbanInfo5.kanbanDateTime = "2015/12/28 16:01"
        kanbanInfo5.kanbanContentText = "这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式"
        kanbanInfo5.kanbanContentImage = [imageInfo4]
        kanbanInfo5.kanbanType = .TypeC
        kanbanInfo5.kanbanHasDetail = true
        
        let kanbanInfo6 = ModelKanban()
        kanbanInfo6.kanbanUserInfo = userInfo1
        kanbanInfo6.kanbanDateTime = "2015/12/28 16:01"
        kanbanInfo6.kanbanContentText = "这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式"
        kanbanInfo6.kanbanContentImage = [imageInfo6, imageInfo7, imageInfo5]
        kanbanInfo6.kanbanType = .TypeC
        kanbanInfo6.kanbanHasDetail = true
        
        let kanbanInfo7 = ModelKanban()
        kanbanInfo7.kanbanUserInfo = userInfo1
        kanbanInfo7.kanbanDateTime = "2015/12/28 16:01"
        kanbanInfo7.kanbanContentText = "这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式"
        kanbanInfo7.kanbanContentImage = [imageInfo6, imageInfo7, imageInfo5, imageInfo1]
        kanbanInfo7.kanbanType = .TypeC
        kanbanInfo7.kanbanHasDetail = true
        
        let kanbanInfo8 = ModelKanban()
        kanbanInfo8.kanbanUserInfo = userInfo1
        kanbanInfo8.kanbanDateTime = "2015/12/28 16:01"
        kanbanInfo8.kanbanContentText = "这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式这是个通用的Cell形式"
        kanbanInfo8.kanbanContentImage = [imageInfo6, imageInfo7, imageInfo5, imageInfo1, imageInfo2]
        kanbanInfo8.kanbanType = .TypeC
        kanbanInfo8.kanbanHasDetail = true
		
		kanbanList.append(kanbanInfo1)
		kanbanList.append(kanbanInfo2)
		kanbanList.append(kanbanInfo3)
		kanbanList.append(kanbanInfo4)
		kanbanList.append(kanbanInfo5)
		kanbanList.append(kanbanInfo6)
		kanbanList.append(kanbanInfo7)
		kanbanList.append(kanbanInfo8)
		
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		
		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return kanbanList.count
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 1
	}
	
	override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 56.0
	}
	
	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let viewHeader = tableView.dequeueReusableHeaderFooterViewWithIdentifier("TableViewHeaderKanban") as! TableViewHeaderKanban
		
		viewHeader.setUserInfo(kanbanList[section].kanbanUserInfo)
		
		return viewHeader
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let modelKanban = kanbanList[indexPath.section]
		
		switch modelKanban.kanbanType {
			
		case .TypeA:
			let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellKanbanCellTypeA", forIndexPath: indexPath) as! TableViewCellKanbanCellTypeA
			
			cell.selectionStyle = UITableViewCellSelectionStyle.None
			
			cell.imageKanbanBG.image = nil
			cell.imageKanbanContent.image = nil
			
			let imageWidth: CGFloat = modelKanban.kanbanContentImage![0].width
			let rate:CGFloat = ScreenWith / imageWidth
			
			cell.imageKanbanContentHeight.constant = (modelKanban.kanbanContentImage![0].height)! * rate
			
			cell.labelImageCount.text = "×\(modelKanban.kanbanContentImage!.count)"
			cell.labelTitle.text = modelKanban.kanbanTitleText
			
			cell.imageKanbanContent.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + modelKanban.kanbanContentImage![0].imageName)!,
			                                           placeholderImage: nil,
			                                           optionsInfo: [.Transition(.Fade(0.6))],
			                                           progressBlock: { (receivedSize, totalSize) -> () in
														
				},
			                                           completionHandler: { (image, error, cacheType, imageURL) -> () in
														
														cell.imageKanbanBG.image = image
														
				}
			)
			
			return cell
			
		case .TypeB:
			
			let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellKanbanCellTypeB", forIndexPath: indexPath) as! TableViewCellKanbanCellTypeB
			
			cell.selectionStyle = UITableViewCellSelectionStyle.None
			
			cell.lableTitle.text = modelKanban.kanbanTitleText
			
			cell.labelSubTitle.text = modelKanban.kanbanSubTitleText
			
			var eroEmojiString = ""
			
			for eroEmoji in modelKanban.kanbanEroEmoji!{
				
				eroEmojiString = eroEmojiString + (EroEmojiKey[eroEmoji]!["emoji"])!
				
			}
			
			cell.labelContent.text = eroEmojiString
			
			return cell
			
		case .TypeC:
			
			let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellKanbanCellTypeC", forIndexPath: indexPath) as! TableViewCellKanbanCellTypeC
			
			cell.loadData(modelKanban)
            
			return cell
			
		default:
			
			return UITableViewCell()
			
		}
		
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		let modelKanban = kanbanList[indexPath.section]
		
		switch modelKanban.kanbanType {
			
		case .TypeA:
			
			return TableViewCellKanbanCellTypeA.getHeightForCell(CGSizeMake(modelKanban.kanbanContentImage![0].width, modelKanban.kanbanContentImage![0].height))
			
		case .TypeB:
			
			let labelFake = UILabel.init(frame: frame(0, y: 0, w: TableViewCellKanbanCellTypeB.getWidthLabelSubTitle(), h: 0))
			labelFake.numberOfLines = 0
			labelFake.font = UIFont.systemFontOfSize(TableViewCellKanbanCellTypeB.fontSizeLabelSubTitle)
			
			var eroEmojiString = ""
			
			for eroEmoji in modelKanban.kanbanEroEmoji!{
				
				eroEmojiString = eroEmojiString + (EroEmojiKey[eroEmoji]!["emoji"])!
				
			}
			
			labelFake.text = eroEmojiString
			labelFake.sizeToFit()
			
			return TableViewCellKanbanCellTypeB.getHeightForCell(labelFake.frame.size.height)
			
		case .TypeC:
			
			let labelFake = UILabel.init(frame: frame(0, y: 0, w: TableViewCellKanbanCellTypeC.getWidthLabelContent(), h: 0))
			labelFake.numberOfLines = 0
			labelFake.font = UIFont.systemFontOfSize(TableViewCellKanbanCellTypeC.fontSizeLabelSubTitle)
			
			labelFake.text = modelKanban.kanbanContentText
			labelFake.sizeToFit()
			
			return TableViewCellKanbanCellTypeC.getHeightForCell(labelFake.frame.size.height, countImage: modelKanban.kanbanContentImage!.count)
			
		default:
			
			return 0;
			
		}
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		let modelKanban = kanbanList[indexPath.section]
		
		if(modelKanban.kanbanHasDetail == false){
			let cell = tableView.cellForRowAtIndexPath(indexPath)
			ShakeView(cell!)
		}
		
	}
	
	override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		
		let modelKanban = kanbanList[indexPath.section]
		
		if(modelKanban.kanbanHasDetail == true){
			let cell = tableView.cellForRowAtIndexPath(indexPath)
			CellShouldHighlightAnimate(cell!)
		}
		
		return true
	}
	
	override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
		let modelKanban = kanbanList[indexPath.section]
		
		if(modelKanban.kanbanHasDetail == true){
			let cell = tableView.cellForRowAtIndexPath(indexPath)
			CellDidUnHighlightAnimate(cell!)
		}
	}
    
    	
	
}
