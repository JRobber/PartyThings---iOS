//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class GuessChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.Guess)
        Hub.Instance.Register(GuessResponse.self) {
            let args : GuessResponse = $0 as! GuessResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
