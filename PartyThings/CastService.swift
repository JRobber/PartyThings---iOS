//
//  CastService.swift
//  PartyThings
//
//  Created by Jeremy Robertson on 6/13/15.
//  Copyright (c) 2015 Jeremy Robertson. All rights reserved.
//

import Foundation

class CastService : NSObject, GCKDeviceScannerListener, GCKDeviceManagerDelegate, GCKMediaControlChannelDelegate  {
    var applicaitonMetadata: GCKApplicationMetadata?
    var selectedDevice: GCKDevice?
    var deviceManager: GCKDeviceManager?
    var filterCriteria: GCKFilterCriteria
    var chromecastButton : UIButton
    var deviceScanner: GCKDeviceScanner
    var btnImage : UIImage
    var btnImageSelected : UIImage
    let kCancelTitle = "Cancel"
    let kDisconnectTitle = "Disconnect"
    var deviceSelHandler:  (GCKDeviceScanner) -> Void
    var kReceiverAppId: String{
        return kGCKMediaDefaultReceiverApplicationID;
    }
    
    var playerNameChannel : PlayerNameChannel
    
    init(deviceSelectionHandler: (GCKDeviceScanner) -> Void){
        deviceSelHandler = deviceSelectionHandler
        deviceScanner = GCKDeviceScanner();
        filterCriteria = GCKFilterCriteria();
        
        playerNameChannel = PlayerNameChannel();
        
        btnImage = UIImage(named: "icon-cast-identified.png")!
        btnImageSelected = UIImage(named: "icon-cast-connected.png")!
        chromecastButton = UIButton(type: UIButtonType.System)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getChromecastButton() -> UIButton {
        chromecastButton.addTarget(self, action: "chooseDevice:", forControlEvents: .TouchUpInside)
        chromecastButton.frame = CGRectMake(0, 0, btnImage.size.width, btnImage.size.height)
        chromecastButton.setImage(nil, forState: UIControlState.Normal)
        chromecastButton.hidden = true
        
        startListener();
        
        return chromecastButton;
    }
    
    func startListener(){
        deviceScanner.addListener(self)
        deviceScanner.startScan()
    }
    
    func chooseDevice(sender:AnyObject) {
        
            if(selectedDevice == nil){
                var sheet : UIActionSheet;
//                = UIActionSheet(title: "Connect to Device",
//                    delegate: self,
//                    cancelButtonTitle: nil,
//                    destructiveButtonTitle: nil)
                
                for device in deviceScanner.devices {
//                    sheet.addButtonWithTitle(device.friendlyName)
                }
                
//                sheet.addButtonWithTitle(kCancelTitle);
//                sheet.cancelButtonIndex = sheet.numberOfButtons - 1;
//                
//                sheet.showInView(chromecastButton)
            }else {
//                updateStatsFromDevice();
                let friendlyName = "Casting to \(selectedDevice!.friendlyName)";
                
                var sheet : UIActionSheet;
//                = UIActionSheet(title: friendlyName, delegate: self, cancelButtonTitle: nil, destructiveButtonTitle: nil);
                var buttonIndex = 0;
                
//                if let info = mediaInformation {
////                    sheet.addButtonWithTitle(info.metadata.objectForKey(kGCKMetadataKeyTitle) as! String);
//                    buttonIndex++;
//                }
            }
    }
    
    func isConnected() -> Bool {
        if let manager = deviceManager {
            return manager.isConnected
        } else {
            return false
        }
    }
    
    func connectToDevice() {
        if (selectedDevice == nil){
            return
        }
        let identifier = NSBundle.mainBundle().infoDictionary?["CFBundleIdentifier"] as! String
        deviceManager = GCKDeviceManager(device: selectedDevice, clientPackageName: identifier)
        deviceManager!.delegate = self
        deviceManager!.connect()
    }
    
    func deviceDisconnected() {
        selectedDevice = nil
        deviceManager = nil
    }
    
    func updateButtonStates() {
        if(deviceScanner.devices.count == 0) {
            chromecastButton.hidden = true;
        } else {
            chromecastButton.setImage(btnImage, forState: UIControlState.Normal);
            chromecastButton.hidden = false;
            
            if(isConnected()) {
                chromecastButton.tintColor = UIColor.blueColor()
            } else {
                chromecastButton.tintColor = UIColor.grayColor()
            }
        }
    }
    
    func showError(error: NSError) {
        var alert = UIAlertController(title: "Error", message: error.description, preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        //self.presentViewController(alert, animated: true, completion: nil)
    }
}

// MARK: GCKDeviceScannerListener
extension CastService {
    
    func deviceDidComeOnline(device: GCKDevice!) {
        print("Device found: \(device.friendlyName)");
        updateButtonStates();
    }
    
    func deviceDidGoOffline(device: GCKDevice!) {
        print("Device went away: \(device.friendlyName)");
        updateButtonStates();
    }
}

// MARK: UIActionSheetDelegate
extension CastService {
    func actionsheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == actionSheet.cancelButtonIndex){
            return;
        } else if (selectedDevice == nil) {
            if(buttonIndex < deviceScanner.devices.count) {
                selectedDevice = deviceScanner.devices[buttonIndex] as? GCKDevice;
                print("Selected device: \(selectedDevice!.friendlyName)");
                connectToDevice();
            }
        } else if (actionSheet.buttonTitleAtIndex(buttonIndex) == kDisconnectTitle) {
            deviceManager!.leaveApplication();
            deviceManager!.disconnect();
            deviceDisconnected();
            updateButtonStates();
        }
    }
}

// MARK: GCKDeviceManagerDelegate
extension CastService {
    
    func deviceManagerDidConnect(deviceManager: GCKDeviceManager!) {
        print("Connected.");
        
        updateButtonStates();
        deviceManager.launchApplication(kReceiverAppId);
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!,
        didConnectToCastApplication
        applicationMetadata: GCKApplicationMetadata!,
        sessionId: String!,
        launchedApplication: Bool) {
            
            print("Application has launched.");
            deviceManager.addChannel(playerNameChannel);
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!,
        didFailToConnectToApplicationWithError error: NSError!) {
            print("Received notification that device failed to connect to application.");
            
            showError(error);
            deviceDisconnected();
            updateButtonStates();
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!,
        didFailToConnectWithError error: NSError!) {
            print("Received notification that device failed to connect.");
            
            showError(error);
            deviceDisconnected();
            updateButtonStates();
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!,
        didDisconnectWithError error: NSError!) {
            print("Received notification that device disconnected.");
            
            if (error != nil) {
                showError(error)
            }
            
            deviceDisconnected();
            updateButtonStates();
    }
    
    func deviceManager(deviceManager: GCKDeviceManager!,
        didReceiveApplicationMetadata metadata: GCKApplicationMetadata!) {
            applicaitonMetadata = metadata;
    }
}

    
    