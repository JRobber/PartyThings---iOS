//
//  GameNameController.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 5/28/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import UIKit

class GameNameController: ControllerBase {
    
    @IBOutlet weak var gameNameText: UILabel!
    @IBOutlet weak var gameName: UITextField!
    @IBOutlet weak var playerName: UITextField!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!;
        
        Hub.Instance.Register(GameNameRequest.self) {
            let args : GameNameRequest = $0 as! GameNameRequest;
           
            self.showViewController(self as GameNameController, sender: self)
            
            if(!args.needsGameName){
            }
        };
    }
    
    public func setNoGameName(){
        self.gameNameText.hidden = true;
        self.gameName.hidden = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitClicked(sender: AnyObject) {
        let newArgs = GameNameResponse(GameName: gameName.text!, PlayerName: playerName.text!);
        Hub.Instance.Send(newArgs);
    }
}

