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
          Text("\(player.firstName) \(player.lastName) #\(player.jerseyNumber)")
            .font(.headline)
          Text("Preferred Position: \(player.preferredPosition)")
            .font(.subheadline)
          Text("Batting Average: \(player.battingAverage)")
            .font(.subheadline)
          Text("Email: \(player.email)")
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
        Player(jerseyNumber: 1, email: "alex@example.com", firstName: "Alex", lastName: "Smith", preferredPosition: "Pitcher", battingAverage: 0.300),
        Player(jerseyNumber: 2, email: "jamie@example.com", firstName: "Jamie", lastName: "Johnson", preferredPosition: "First Base", battingAverage: 0.275),
        Player(jerseyNumber: 3, email: "pat@example.com", firstName: "Pat", lastName: "Miller", preferredPosition: "Shortstop", battingAverage: 0.280),
        Player(jerseyNumber: 4, email: "taylor@example.com", firstName: "Taylor", lastName: "Davis", preferredPosition: "Third Base", battingAverage: 0.310),
        Player(jerseyNumber: 5, email: "jordan@example.com", firstName: "Jordan", lastName: "Brown", preferredPosition: "Outfield", battingAverage: 0.295),
        Player(jerseyNumber: 6, email: "casey@example.com", firstName: "Casey", lastName: "Jones", preferredPosition: "Catcher", battingAverage: 0.260),
        Player(jerseyNumber: 7, email: "alexandra@example.com", firstName: "Alexandra", lastName: "Garcia", preferredPosition: "Second Base", battingAverage: 0.275),
        Player(jerseyNumber: 8, email: "terry@example.com", firstName: "Terry", lastName: "Rodriguez", preferredPosition: "Outfield", battingAverage: 0.285),
        Player(jerseyNumber: 9, email: "sam@example.com", firstName: "Sam", lastName: "Martinez", preferredPosition: "Pitcher", battingAverage: 0.295),
        Player(jerseyNumber: 10, email: "chris@example.com", firstName: "Chris", lastName: "Moore", preferredPosition: "Shortstop", battingAverage: 0.270),
        Player(jerseyNumber: 11, email: "alex@example.com", firstName: "Alex", lastName: "White", preferredPosition: "Third Base", battingAverage: 0.305),
        Player(jerseyNumber: 12, email: "jess@example.com", firstName: "Jess", lastName: "Hernandez", preferredPosition: "Catcher", battingAverage: 0.290)
      ]


    RosterView(players: samplePlayers)
  }
}
