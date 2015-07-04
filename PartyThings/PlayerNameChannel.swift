//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class PlayerNameChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.PlayerName)
        Hub.Instance.Register(PlayerNameResponse.self) {
            let args : PlayerNameResponse = $0 as! PlayerNameResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
