//
//  RootController.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/27/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import Foundation

class RootController : UIViewController {
    let gameNameView : LazyVewController = LazyVewController(cName: "GameNameView")
    let readyView : LazyVewController = LazyVewController(cName: "ReadyView")
    let selectPromptView : LazyVewController = LazyVewController(cName: "SelectPromptView")
    let enterResponseView : LazyVewController = LazyVewController(cName: "EnterResponseView")
    let pickResponseView : LazyVewController = LazyVewController(cName: "PickResponseView")
    let pickPlayerView : LazyVewController = LazyVewController(cName: "PickPlayerView")
    let resultsView : LazyVewController = LazyVewController(cName: "ResultsView")
    let waitingView : LazyVewController = LazyVewController(cName: "WaitingView")
    let enterGameView : LazyVewController = LazyVewController(cName: "EnterGameView")
    var castMock : CastMock!;
    
    @IBOutlet weak var contentView: UIView!
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionTo(enterGameView)
        registerListeners();
        castMock = CastMock();
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inactiveVC = inactiveViewController {
            inactiveVC.willMoveToParentViewController(nil);
            
            inactiveVC.view.removeFromSuperview();
            
            
            inactiveVC.removeFromParentViewController();
        }
    }
    
    private func updateActiveViewController() {
        if let active = activeViewController {
            addChildViewController(active);
            
            active.view.frame = contentView.bounds;
            contentView.addSubview(active.view)
            
            active.didMoveToParentViewController(self);
        }
    }
    
    func transitionTo(ctrl: LazyVewController){
        activeViewController = ctrl.getVC(self);
    }
    
    func registerListeners(){
        Hub.Instance.Register(GameNameRequest.self) {
            let args : GameNameRequest = $0 as! GameNameRequest;
            self.transitionTo(self.gameNameView)
        };
        Hub.Instance.Register(PlayerNameRequest.self) {
            let args : PlayerNameRequest = $0 as! PlayerNameRequest;
            
            var vc = self.gameNameView.getVC(self) as! GameNameController;
            vc.setNoGameName();
            
            self.transitionTo(self.gameNameView)
        };
        Hub.Instance.Register(ReadyRequest.self) {
            let args : ReadyRequest = $0 as! ReadyRequest;
            self.transitionTo(self.readyView)
        };
        Hub.Instance.Register(PromptRequest.self) {
            let args : PromptRequest = $0 as! PromptRequest;
            
            var vc = self.selectPromptView.getVC(self) as! SelectPromptController;
            vc.setPrompts(args.Prompts);
            
            self.transitionTo(self.selectPromptView)
        };
        Hub.Instance.Register(ThingRequest.self) {
            let args : ThingRequest = $0 as! ThingRequest;
            self.transitionTo(self.enterResponseView)
        };
        Hub.Instance.Register(GuessRequest.self) {
            let args : GuessRequest = $0 as! GuessRequest;
            self.transitionTo(self.pickPlayerView)
        };
        
        //toWaiting
        Hub.Instance.Register(ReadyResponse.self) {
            let args : ReadyResponse = $0 as! ReadyResponse;
            self.transitionTo(self.waitingView)
        };
        Hub.Instance.Register(PromptResponse.self) {
            let args : PromptResponse = $0 as! PromptResponse;
            self.transitionTo(self.waitingView)
        };
        Hub.Instance.Register(ThingResponse.self) {
            let args : ThingResponse = $0 as! ThingResponse;
            self.transitionTo(self.waitingView)
        };
        Hub.Instance.Register(GuessResponse.self) {
            let args : GuessResponse = $0 as! GuessResponse;
            self.transitionTo(self.waitingView)
        };
        Hub.Instance.Register(StandByRequest.self) {
            let args : StandByRequest = $0 as! StandByRequest;
            self.transitionTo(self.waitingView)
        };
    }
}

class LazyVewController {
    var viewController : UIViewController?
    let cName : String;
    
    init(cName: String){
        self.cName = cName;
    }
    
    func getVC(ctrl: UIViewController) -> UIViewController {
        if(viewController == nil){
            viewController = (ctrl.storyboard!.instantiateViewControllerWithIdentifier(self.cName) as! UIViewController);
        }
        return viewController!;
    }
}