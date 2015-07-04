
//
//  EnterGameArgs.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import Foundation

class GameNameRequest {
    var needsGameName: Bool;
    init(needsGameName : Bool){
    self.needsGameName = needsGameName
    }
}

class GameNameResponse {
    var GameName: String
    var PlayerName: String
    init(GameName: String, PlayerName: String){
        self.GameName = GameName;
        self.PlayerName = PlayerName;
    }
}

class PlayerNameRequest {
    
}

class PlayerNameResponse {
    var PlayerName: String
    init(PlayerName : String) {
        self.PlayerName = PlayerName;
    }
}

class StandByRequest {
    
}

class ReadyRequest {
    
}

class ReadyResponse {
    
}

class PromptRequest {
    var Prompts: [String]
    init(Prompts: [String]){
        self.Prompts = Prompts;
    }
}

class PromptResponse {
    var Prompt: String
    init(Prompt : String){
        self.Prompt = Prompt;
    }
}

class ThingRequest {
    var Prompt: String
    init(Prompt : String) {
        self.Prompt = Prompt;
    }
}

class ThingResponse {
    var Thing: String
    init(Thing : String) {
        self.Thing = Thing;
    }
}

class GuessRequest {
    var Prompts: [String]
    var Players: [String]
    init(Prompts: [String], Players: [String]){
        self.Prompts = Prompts;
        self.Players = Players;
    }
}
class GuessResponse {
    var Player: String
    var Prompt: String
    init(Player : String, Prompt : String){
        self.Player = Player;
        self.Prompt = Prompt;
    }
}
class QuitRequest {}
class QuitResponse {
    var Quitting: Bool
    init(Quitting : Bool){
        self.Quitting = Quitting;
    }
}