//
//  CreationViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet var container: UIView!
    weak var delegate: CreationViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        var delay = 0.0
        for sv in container.subviews {
            sv.alpha = 0.0
            sv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.75, 0.75)
            UIView.animateWithDuration(0.6, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: {
                sv.alpha = 1.0
                sv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
            }, completion: nil)
            delay += 0.1
        }
    }

    @IBAction func btnClosePressed() {
        delegate?.creationDidCancel(self)
    }
    
    @IBAction func btnStudyPressed() {
        
        // Create event and then tell the delegate
        let course = Class(id: "1", name: "BIO 100: Introduction to Biology", school: "UC Santa Cruz")
        let event = Event(id: "1", name: "BIO 100 Study Group", locationName: "Peet's coffee @ the library", eventClass: course)
        delegate?.creation(self, didFinishWithEvent: event);
    }

}

protocol CreationViewControllerDelegate: NSObjectProtocol {
    
    func creationDidCancel(creationController: CreationViewController)
    func creation(creationController: CreationViewController, didFinishWithEvent: Event)
}