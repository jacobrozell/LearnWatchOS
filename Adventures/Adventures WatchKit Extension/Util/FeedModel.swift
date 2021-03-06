//
//  FeedModel.swift
//  DownloadingData WatchKit Extension
//
//  Created by Jacob Rozell on 12/27/19.
//  Copyright © 2019 jacobrozell. All rights reserved.
//

import Foundation
import UIKit

// MARK: - FeedModel
struct ScreenFeed: Codable {
    let screens: [Screen]
    
    init(screens: [Screen]) {
        self.screens = screens
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        screens = try container.decode([Screen].self, forKey: .screens)
    }
    
    private enum CodingKeys: CodingKey {
        case screens
    }
}

// Screen and Parsing
struct Screen: Codable {
    let text: String
    let subtext: String
    let options: Options
    
    init(text: String, subtext: String, options: Options) {
        self.text = text
        self.subtext = subtext
        self.options = options
    }
    
    init() {
        self.init(text: "", subtext: "", options: Options(good: [], bad: []))
    }
}

struct Options: Codable {
    let good: [Option]
    let bad: [Option]
    
    init(good: [Option], bad: [Option]) {
        self.good = good
        self.bad = bad
    }
}

struct Option: Codable {
    let choice: String
    let screenLink: Int
    let rewards: Reward
    
    init(choice: String, screenLink: Int, rewards: Reward) {
        self.choice = choice
        self.screenLink = screenLink
        self.rewards = rewards
    }
}

struct Reward: Codable {
    var factionPoints: Int = 0
    var exp: Double = 0
    var money: Int = 0
    
    init(factionPoints: Int=0, exp: Double=0, money: Int=0) {
        self.factionPoints = factionPoints
        self.exp = exp
        self.money = money
    }
    
    init() {
        self.factionPoints = 0
        self.exp = 0
        self.money = 0
    }
}

// MARK: - Parser
class ScreenParser {
    func parseObjectOfScreenFeedFromData(_ data: Data?) -> ScreenFeed? {
        guard let dataIn = data else { return nil }
        if let result = try? JSONDecoder().decode(ScreenFeed.self, from: dataIn) {
            return result
        }
        return nil
    }
}
