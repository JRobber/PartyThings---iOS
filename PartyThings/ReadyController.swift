//
//  ReadyController.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 5/31/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import UIKit

class ReadyController: UIViewController {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        Hub.Instance.Register(ReadyRequest.self) {
            let args : ReadyRequest = $0 as! ReadyRequest;
            
            self.showViewController(self as ReadyController, sender: self)
        };
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func readyUp(sender: AnyObject) {
        Hub.Instance.Send(ReadyResponse());
    }
}