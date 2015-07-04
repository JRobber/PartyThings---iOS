//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class GameNameChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.GameName)
        Hub.Instance.Register(GameNameResponse.self) {
            let args : GameNameResponse = $0 as! GameNameResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}