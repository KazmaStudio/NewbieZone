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
        
        let cellGoodsNib = UINib(nibName: "TableViewCellKanbanCellTypeA", bundle: nil)
        self.tableView.registerNib(cellGoodsNib, forCellReuseIdentifier: "TableViewCellKanbanCellTypeA")
        
        let cellHeaderNib = UINib(nibName: "TableViewHeaderKanban", bundle: nil)
        self.tableView.registerNib(cellHeaderNib, forHeaderFooterViewReuseIdentifier: "TableViewHeaderKanban")
        
        let userInfo1 = ModelUser()
        userInfo1.userID = 0
        userInfo1.userName = "用户名1"
        userInfo1.userTitle = "@初号机驾驶员"
		userInfo1.userAvatar = "girl.png"
		
		let userInfo2 = ModelUser()
		userInfo2.userID = 1
		userInfo2.userName = "用户名222222"
		userInfo2.userTitle = "@死鱼眼"
		userInfo1.userAvatar = "girl.png"
		
        let kanbanInfo1 = ModelKanban()
        kanbanInfo1.kanbanUserInfo = userInfo1
        kanbanInfo1.kanbanDateTime = "2015/12/28 16:01"
        
        let kanbanInfo2 = ModelKanban()
        kanbanInfo2.kanbanUserInfo = userInfo2
        kanbanInfo2.kanbanDateTime = "2015/12/28 15:23"
        
        kanbanList.append(kanbanInfo1)
        kanbanList.append(kanbanInfo2)
		kanbanList.append(kanbanInfo2)
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
		viewHeader.labelSub.text = kanbanList[section].kanbanDateTime
        return viewHeader
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellKanbanCellTypeA", forIndexPath: indexPath) as! TableViewCellKanbanCellTypeA
        
        //cell.textLabel?.text = kanbanList[indexPath.row].kanbanUserInfo.userName
        //cell.detailTextLabel?.text = kanbanList[indexPath.row].kanbanDateTime

        // Configure the cell...
        
        let imageContent = UIImage.init(named: "GK" + String( indexPath.section ) + ".jpg")
        
        cell.imageKanbanContent!.image = imageContent
        cell.imageKanbanBG!.image = imageContent
        
        let imageWidth: CGFloat = (imageContent?.size.width)!
        let rate:CGFloat = ScreenWith / imageWidth
        
        cell.imageKanbanContentHeight.constant = (imageContent?.size.height)! * rate

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let imageContent = UIImage.init(named: "GK" + String( indexPath.section ) + ".jpg")
        
        let imageWidth: CGFloat = (imageContent?.size.width)!
        let rate:CGFloat = ScreenWith / imageWidth
        
        return (imageContent?.size.height)! * rate
    
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
