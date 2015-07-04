//
//  Namespaces.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

enum Channels: String, Printable {
    case GameName = "gamename"
    case PlayerName = "playername"
    case StandBy = "standby"
    case Ready = "ready"
    case Prompt = "prompt"
    case Thing = "thing"
    case Guess = "guess"
    case Quit = "quit"
    
    var description: String {
        return self.rawValue
    }
}