//
//  ViewController.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 5/26/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import UIKit

class EnterGameController : ControllerBase, UIActionSheetDelegate
{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func skpConnect(sender: AnyObject) {
        Hub.Instance.Send(GameNameRequest(needsGameName: true));
    }
}