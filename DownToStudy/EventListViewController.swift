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
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Go ahead and set the delegate and datasource for the event list
        eventTableView.dataSource = self
        eventTableView.delegate = self
        eventTableView.backgroundColor = UIColor.clearColor()
        eventTableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
        
        let bio = Class(id: "1", name: "BIO 100: Introduction to Biology", school: "UC Santa Cruz")
        let math = Class(id: "2", name: "MATH 110: Business Calculus", school: "UC Santa Cruz")
        let csc = Class(id: "3", name: "CS 101: Algorithms", school: "UC Santa Cruz")
        let demoStudents = director.demoStudents
        var randomIndex = Int(arc4random()) % demoStudents.count
        randomIndex = randomIndex > 0 ? randomIndex : 1
        var students = [User]()
        for idx in Array(0...randomIndex) {
            students.append(demoStudents[idx])
        }
        events.append(Event(id: "1", name: "BIO 100", locationName: "Peet's in the library", availableSpots: 2, eventClass: bio, students: students, joined: false))
        randomIndex = Int(arc4random()) % demoStudents.count
        randomIndex = randomIndex > 0 ? randomIndex : 1
        students = [User]()
        for idx in Array(0...randomIndex) {
            students.append(demoStudents[idx])
        }
        events.append(Event(id: "2", name: "MATH 110", locationName: "Basement study room", availableSpots: 1, eventClass: math, students: students, joined: false))
        randomIndex = Int(arc4random()) % demoStudents.count
        randomIndex = randomIndex > 0 ? randomIndex : 1
        students = [User]()
        for idx in Array(0...randomIndex) {
            students.append(demoStudents[idx])
        }
        events.append(Event(id: "3", name: "CS 101", locationName: "Tutoring room", availableSpots: 3, eventClass: csc, students: students, joined: false))
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // If position 0 return the header cell else just return an event cell
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("eventHeaderCell") as UITableViewCell!
            cell.selectionStyle = UITableViewCellSelectionStyle.Blue;
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as! EventCell!
            cell.selectionStyle = UITableViewCellSelectionStyle.Blue;
            cell.backgroundColor = UIColor.clearColor()
            
            let event = events[indexPath.row-1]
            cell.update(event)
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // TODO
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count + 1 // for the header
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailEventViewController = storyboard?.instantiateViewControllerWithIdentifier("detailEventViewController") as! DetailEventViewController
        let event = events[indexPath.row-1]
        detailEventViewController.event = event
        presentViewController(detailEventViewController, animated: true, completion: nil)
    }
    
    // Page Controller protocol
    override func reload(animated: Bool) -> Void {
        
    }
}
