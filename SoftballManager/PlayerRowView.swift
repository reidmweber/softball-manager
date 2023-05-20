//
//  PlayerRowView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct PlayerRowView: View {
    var player: Player

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(player.firstName) \(player.lastName)")
                .font(.headline)
            Text("Jersey Number: \(player.jerseyNumber)")
                .font(.subheadline)
            Text("Position: \(player.preferredPosition)")
                .font(.subheadline)
        }
    }
}


struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: Player(jerseyNumber: 5, email: "test@example.com", firstName: "Alex", lastName: "Smith", preferredPosition: "Pitcher", battingAverage: 0.298))
    }
}
