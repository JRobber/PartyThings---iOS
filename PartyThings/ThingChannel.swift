//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class ThingChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.Thing)
        Hub.Instance.Register(ThingResponse.self) {
            let args : ThingResponse = $0 as! ThingResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
