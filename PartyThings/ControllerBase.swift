//
//  ControllerBase.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/22/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import Foundation

class ControllerBase : UIViewController {
    func transitionToWaiting(moveNext : Bool = true) {
        Hub.Instance.Send(StandByRequest());
    }
}