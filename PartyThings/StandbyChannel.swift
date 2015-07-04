//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class StandbyChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.StandBy)
       
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
