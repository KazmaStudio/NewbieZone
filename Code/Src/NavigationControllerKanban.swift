//
//  NavigationControllerKanban.swift
//  newbiezone
//
//  Created by zhaochenjun on 15/12/22.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

class NavigationControllerKanban: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboardKanban: UIStoryboard
        storyboardKanban = UIStoryboard.init(name: "Kanban", bundle: nil)
        
        var tabelViewControllerKanban: TableViewControllerKanban
        tabelViewControllerKanban = storyboardKanban.instantiateViewControllerWithIdentifier("kanbanTable") as! TableViewControllerKanban

        self.setViewControllers([tabelViewControllerKanban], animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
