//
//  EnterGameChannel.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/9/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import Foundation

//Custom Channel class that extends GCKCastChannel
class CustomChannelBase: GCKCastChannel {
    
    static var urnPrefix = "urn:x-cast:";
    
    init(channel: Channels) {
        super.init(namespace: CustomChannelBase.urnPrefix + channel.description);
    }
}

