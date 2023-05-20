//
//  GameScheduleView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct GameScheduleView: View {
    @EnvironmentObject var gameManager: GameManager
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        NavigationView {
            List {
                ForEach(gameManager.events) { event in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(event.homeAway == .away ? "@ \(event.opponent)" : "Vs. \(event.opponent)")
                            Text(dateFormatter.string(from: event.starts))
                        }
                        Spacer()
                    }
                }
                .onDelete(perform: removeEvent)
            }
            .navigationBarTitle("Game Schedule")
            .navigationBarItems(trailing:
                NavigationLink(
                    destination: GameDetailView(gameManager: gameManager, event: Event(eventType: .game, isScrimmage: false, homeAway: .home, opponent: "", location: "", starts: Date(), duration: 60 * 60, arriveEarly: 15, repeatOption: .never, notes: "")),
                    label: {
                        Image(systemName: "plus")
                    })
            )
        }
    }

    private func removeEvent(at offsets: IndexSet) {
        for index in offsets {
            let event = gameManager.events[index]
            gameManager.removeEvent(event)
        }
    }
}


struct GameScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        GameScheduleView()
            .environmentObject(GameManager())
    }
}
