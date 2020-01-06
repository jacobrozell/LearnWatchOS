//
//  Config.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/29/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import WatchKit
import UIKit

enum GameConfig {
    
    // MARK: - Player Class Constants
    enum PlayableClass: String, Codable {
        case mage = "mage"
        case warrior = "warrior"
        case unset = "unset"
    }
    
    public static var chosenClass = false
    static var playerClass: PlayableClass = .unset

    public static var characterCreationICID = "characterCreationScreen"
    public static var userDefaults = UserDefaults.standard
    
    public static var screenID = "screenViewController"
    public static var screenFeed = ScreenFeed(screens: [])
    
    public static var profileViewID = "profileView"
    
}

enum UserDefaultsKeys {
    public static var playerClass = "playerClass"
}

func navigate(to id: String, from controller: WKInterfaceController, shouldChangeRoot: Bool=false) {
    
    if shouldChangeRoot {
        WKInterfaceController.reloadRootControllers(withNamesAndContexts: [(name: id, context: [:] as AnyObject)])
    }

    controller.pushController(withName: id, context: nil)
}
