//
//  RosterView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct RosterView: View {
    var players: [Player]

    var body: some View {
        NavigationView {
            List(players) { player in
                VStack(alignment: .leading) {
                    Text(player.name)
                        .font(.headline)
                    Text(player.position)
                        .font(.subheadline)
                    Text("Batting Average: \(player.battingAverage)")
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Team Roster")
        }
    }
}


struct RosterView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePlayers = [
                    Player(name: "Alex", position: "Pitcher", battingAverage: 0.300),
                    Player(name: "Jamie", position: "First Base", battingAverage: 0.275),
                    Player(name: "Pat", position: "Shortstop", battingAverage: 0.280),
                    Player(name: "Taylor", position: "Third Base", battingAverage: 0.310),
                    Player(name: "Jordan", position: "Outfield", battingAverage: 0.295)
                ]
                
                RosterView(players: samplePlayers)
    }
}
