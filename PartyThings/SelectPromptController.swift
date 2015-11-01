//
//  SelectPromptViewController.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 5/26/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import UIKit

class SelectPromptController: UIViewController {
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    var lastPrompts : [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(self.lastPrompts.count == 3){
            option1.setTitle(lastPrompts[0], forState: UIControlState.Normal);
            option2.setTitle(lastPrompts[1], forState: UIControlState.Normal);
            option3.setTitle(lastPrompts[2], forState: UIControlState.Normal);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func setPrompts(prompts: [String]) {
        self.lastPrompts = prompts;
    }
    
    @IBAction func option1Selected(sender: AnyObject) {
        Hub.Instance.Send(PromptResponse(Prompt: option1.titleLabel!.text!))
    }
    
    @IBAction func option2Selected(sender: AnyObject) {
         Hub.Instance.Send(PromptResponse(Prompt: option2.titleLabel!.text!))
    }
    
    @IBAction func option3Selected(sender: AnyObject) {
         Hub.Instance.Send(PromptResponse(Prompt: option3.titleLabel!.text!))
    }
}

