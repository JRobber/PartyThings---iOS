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
    var lastPrompts : [String];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        if(self.lastPrompts.count == 3){
            option1.titleLabel!.text = lastPrompts[0];
            option2.titleLabel!.text = lastPrompts[1];
            option3.titleLabel!.text = lastPrompts[2];
        }
    }
    
    public func setPrompts(prompts: [String]) {
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

