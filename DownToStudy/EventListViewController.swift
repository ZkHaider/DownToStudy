//
//  EventListViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Go ahead and set the delegate and datasource for the event list
        eventTableView.dataSource = self
        eventTableView.delegate = self
        eventTableView.backgroundColor = UIColor.clearColor()
        eventTableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // If position 0 return the header cell else just return an event cell
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("eventHeaderCell") as UITableViewCell!
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as UITableViewCell!
            return cell
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // TODO
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // TODO find row
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Do something if event selected
    }

}
