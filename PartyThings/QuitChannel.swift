//
//  GameNameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

class QuitChannel: CustomChannelBase {
    init() {
        super.init(channel: Channels.Quit)
        Hub.Instance.Register(QuitResponse.self) {
            let args : QuitResponse = $0 as! QuitResponse;
        };
    }
    
    override func didReceiveTextMessage(message: String!) {
        
    }
}
