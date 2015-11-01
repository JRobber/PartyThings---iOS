//
//  EnterPromptPane.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 5/31/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import UIKit

class EnterResponseController: UIViewController {
    
    @IBOutlet weak var promptPlaceholder: UILabel!
    @IBOutlet weak var responseText: UITextField!
    
    var nextText : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(nextText != ""){
            self.promptPlaceholder.text = nextText;
        }
    }
    
    func setPromptText(text: String){
        self.nextText = text;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(sender: AnyObject) {
        Hub.Instance.Send(ThingResponse(Thing: responseText.text!));
    }
}