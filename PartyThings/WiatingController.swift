//
//  File.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 5/31/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import UIKit

class WaitingController: UIViewController {
    
    var waitCount : Int = 0;
    var timer = NSTimer() //make a timer variable, but don't do anything yet
    let timeInterval:NSTimeInterval = 5.0
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
            target: self,
            selector: "timerDidEnd:",
            userInfo: "Pizza Done!!",
            repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Instance Methods
    func timerDidEnd(timer:NSTimer){
        //first iteration of timer
        timer.invalidate();
        waitCount++;
        switch(waitCount){
            case 1:
                Hub.Instance.Send(ThingRequest(Prompt: "A thing?"))
                break;
            default:
                break;
        }
    }
    
    //@IBAction func b1Click(sender:AnyObject) {
    //  performSegueWithIdentifier("SegGameName", sender: self);
    //}
}