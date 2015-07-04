//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class PromptChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.Prompt)
        Hub.Instance.Register(PromptResponse.self) {
            let args : PromptResponse = $0 as! PromptResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
