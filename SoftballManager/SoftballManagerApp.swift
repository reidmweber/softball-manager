//
//  SoftballManagerApp.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

@main
struct SoftballManagerApp: App {
    let samplePlayers = [
                Player(name: "Alex", position: "Pitcher", battingAverage: 0.300),
                Player(name: "Jamie", position: "First Base", battingAverage: 0.275),
                Player(name: "Pat", position: "Shortstop", battingAverage: 0.280),
                Player(name: "Taylor", position: "Third Base", battingAverage: 0.310),
                Player(name: "Jordan", position: "Outfield", battingAverage: 0.295)
            ]
    var body: some Scene {
        WindowGroup {
            RosterView(players: samplePlayers)
        }
    }
}
