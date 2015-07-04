//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class ReadyChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.Ready)
        Hub.Instance.Register(ReadyResponse.self) {
            let args : ReadyResponse = $0 as! ReadyResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
