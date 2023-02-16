//
//  AppUserDefault.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/16.
//

import Foundation
import Combine
import SwiftUI

public class AppUserDefaults: ObservableObject {
    public static let shared = AppUserDefaults()
    
    @AppStorage("island_name")
    public var islandName = ""
    
    @AppStorage("game_name")
    public var inGameName = ""
    
    @AppStorage("dodo_code")
    public var dodoCode = "dodo_code 123456"
    
    @AppStorage("spotlight_index_version")
    public var spotlightIndexVersion =  ""
    
    @AppStorage("number_of_launch")
    public var numberOfLaunch = 0
    
    @AppStorage("dodo_notifications")
    public var dodoNotifications = false
    
    @AppStorage("news_notifications")
    public var newsNotifications = true

    @AppStorage("dream_notifications")
    public var dreamNotifications = false
}

