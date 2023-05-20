//
//  Event.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import Foundation

struct Event: Identifiable, Codable {
    var id = UUID()
    var eventType: EventType
    var isScrimmage: Bool
    var homeAway: HomeAway
    var opponent: String
    var location: String
    var starts: Date
    var duration: TimeInterval
    var arriveEarly: Int
    var repeatOption: RepeatOption
    var notes: String
}

enum EventType: String, CaseIterable, Codable {
    case game = "Game"
    case practice = "Practice"
    case other = "Other"
}

enum HomeAway: String, CaseIterable, Codable {
    case home = "Home"
    case away = "Away"
    case tbd = "TBD"
}

enum RepeatOption: String, CaseIterable, Codable {
    case never = "Never"
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}
