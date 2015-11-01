//
//  Hub.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import Foundation

class Hub {
    static let Instance = Hub();
    
    private init(){}
    
    var listeners = Dictionary<String, (AnyObject) -> Void>();
    
    func Register<T>(_:T.Type, cBack:((AnyObject) -> Void)){
        listeners["\(T.self)"] = cBack;
    }
    
    func Send<T>(args: T){
        let val = listeners["\(T.self)"];
        if(val != nil){
            let argsTyped: AnyObject = args as! AnyObject;
            val!(argsTyped);
        }
    }
}