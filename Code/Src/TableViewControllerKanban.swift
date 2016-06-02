//
//  TableViewControllerKanban.swift
//  newbiezone
//
//  Created by zhaochenjun on 15/12/22.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

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
		userInfo2.userAvatar = "girl.png"
		
        let kanbanInfo1 = ModelKanban()
        kanbanInfo1.kanbanUserInfo = userInfo1
        kanbanInfo1.kanbanDateTime = "2015/12/28 16:01"
        kanbanInfo1.kanbanTitleText = "踩踩踩踩踩踩踩踩超级计算机计算机世界神经计算机熬枯受淡静安收到了卡登仕"
        kanbanInfo1.kanbanContentImage = ["GK1.jpg","GK2.jpg","GK3.jpg"]
        kanbanInfo1.kanbanType = 0
        kanbanInfo1.kanbanHasDetail = true
        
        let kanbanInfo2 = ModelKanban()
        kanbanInfo2.kanbanUserInfo = userInfo2
        kanbanInfo2.kanbanDateTime = "2015/12/28 15:23"
        kanbanInfo2.kanbanTitleText = "SOD 051"
        kanbanInfo2.kanbanSubTitleText = "白石茉莉奈"
        kanbanInfo2.kanbanEroEmoji = ["EEK01", "EEK08", "EEK16","EEK02", "EEK18", "EEK09", "EEK12", "EEK07", "EEK14",]
        kanbanInfo2.kanbanType = 1
        kanbanInfo2.kanbanHasDetail = false
        
        let kanbanInfo3 = ModelKanban()
        kanbanInfo3.kanbanUserInfo = userInfo1
        kanbanInfo3.kanbanDateTime = "2015/12/28 16:01"
        kanbanInfo3.kanbanTitleText = "踩踩踩踩踩踩踩踩超级计算机计算机世界神经计算机熬枯受淡静安收到了卡登仕"
        kanbanInfo3.kanbanContentImage = ["GK2.jpg","GK3.jpg"]
        kanbanInfo3.kanbanType = 0
        kanbanInfo3.kanbanHasDetail = true
        
        kanbanList.append(kanbanInfo1)
        kanbanList.append(kanbanInfo2)
		kanbanList.append(kanbanInfo3)
		kanbanList.append(kanbanInfo1)
		kanbanList.append(kanbanInfo2)
		kanbanList.append(kanbanInfo1)
		kanbanList.append(kanbanInfo1)
		kanbanList.append(kanbanInfo1)

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
        
        if (modelKanban.kanbanType == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellKanbanCellTypeA", forIndexPath: indexPath) as! TableViewCellKanbanCellTypeA
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            let imageContent = UIImage.init(named: modelKanban.kanbanContentImage![0])
            
            guard imageContent != nil else{return cell}
            
            cell.imageKanbanContent!.image = imageContent
            cell.imageKanbanBG!.image = imageContent
            
            let imageWidth: CGFloat = (imageContent?.size.width)!
            let rate:CGFloat = ScreenWith / imageWidth
            
            cell.imageKanbanContentHeight.constant = (imageContent?.size.height)! * rate
            
            cell.labelImageCount.text = "×\(modelKanban.kanbanContentImage!.count)"
            cell.labelTitle.text = modelKanban.kanbanTitleText
            
            return cell
            
        }else if (modelKanban.kanbanType == 1){
            
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
            
        }
        
        
        return UITableViewCell()
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let modelKanban = kanbanList[indexPath.section]
        
        if (modelKanban.kanbanType == 0){
            
            let imageContent = UIImage.init(named: modelKanban.kanbanContentImage![0])
        
            let imageWidth: CGFloat = (imageContent?.size.width)!
            let rate:CGFloat = ScreenWith / imageWidth
        
            return (imageContent?.size.height)! * rate + 40
            
        }else if (modelKanban.kanbanType == 1){
            
            let labelFake = UILabel.init(frame: frame(0, y: 0, w: ScreenWith - 16, h: 0))
            labelFake.numberOfLines = 0
            labelFake.font = UIFont.systemFontOfSize(32)
            
            var eroEmojiString = ""
            
            for eroEmoji in modelKanban.kanbanEroEmoji!{
                
                eroEmojiString = eroEmojiString + (EroEmojiKey[eroEmoji]!["emoji"])!
                
            }
            
            labelFake.text = eroEmojiString
            labelFake.sizeToFit()
            
            return 8 + 64 - 8 + 21 + 8 + labelFake.frame.size.height + 8 + 16
            
        }
        
        return 0;
    
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
