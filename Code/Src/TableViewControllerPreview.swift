//
//  TableViewControllerPreview.swift
//  NewbieZone
//
//  Created by zhaochenjun on 16/6/17.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewControllerPreview: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellTypeANib = UINib(nibName: "TableViewCellPreviewCellTypeA", bundle: nil)
        self.tableView.registerNib(cellTypeANib, forCellReuseIdentifier: "TableViewCellPreviewCellTypeA")
        
        let cellHeaderNib = UINib(nibName: "TableViewHeaderPreview", bundle: nil)
        self.tableView.registerNib(cellHeaderNib, forHeaderFooterViewReuseIdentifier: "TableViewHeaderPreview")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        showTopStatusBlurView()
    }
    
    override func viewDidDisappear(animated: Bool) {
        hideTopStatusBlurView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = tableView.dequeueReusableHeaderFooterViewWithIdentifier("TableViewHeaderPreview") as! TableViewHeaderPreview
        viewHeader.contentView.backgroundColor = rgba(180, g: 180, b: 180, a: 1)
        viewHeader.labelDate.text = "6月23日"
        
        addTagViewsToView(viewHeader, tags: ["新番","手办","展会"])
        
        return viewHeader
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 64
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellPreviewCellTypeA", forIndexPath: indexPath) as! TableViewCellPreviewCellTypeA
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        cell.imageViewContent.image = UIImage.init(named: "event1.jpg")
        cell.labelTitle.text = "番剧名称 第一季第五集"
        cell.labelSubTitle.text = "优酷 bilibili"
        cell.labelReadCount.text = "2,332"

        return cell
    }

    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        CellShouldHighlightAnimate(cell!, deltaHeight: 0)
        
        return true
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {

        let cell = tableView.cellForRowAtIndexPath(indexPath)
        CellDidUnHighlightAnimate(cell!)
        
    }
    
    // MARK: - func
    func addTagViewsToView(view: UIView, tags: Array<String>) {
        
        var lastX = ScreenWidth
        
        for i in 0 ..< tags.count{
            
            let tagName = tags[i]
            
            let tagViewWidth = CGFloat(tagName.characters.count) * 10 + MarginDefault
            
            lastX = lastX - tagViewWidth - MarginDefault
            
            let viewTag = UILabel.init(frame: frame(lastX, y: (view.frame.height - 14 ) / 2, w: tagViewWidth, h: 14))

            viewTag.backgroundColor = rgba(220, g: 220, b: 220, a: 220)
            viewTag.cornerRadius = 6
            viewTag.textColor = UIColor.whiteColor()
            viewTag.text = tagName
            viewTag.font = UIFont.systemFontOfSize(10)
            viewTag.textAlignment = .Center
            
            view.addSubview(viewTag)
            
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
