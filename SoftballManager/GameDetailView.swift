//
//  GameDetailView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct GameDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var gameManager: GameManager
    @State var event: Event

    var body: some View {
        NavigationView {
            Form {
                Picker("Event Type", selection: $event.eventType) {
                    ForEach(EventType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                
                Toggle("Scrimmage", isOn: $event.isScrimmage)

                Picker("Home/Away", selection: $event.homeAway) {
                    ForEach(HomeAway.allCases, id: \.self) { homeAway in
                        Text(homeAway.rawValue).tag(homeAway)
                    }
                }

                TextField("Opponent", text: $event.opponent)
                TextField("Location", text: $event.location)

                DatePicker("Starts", selection: $event.starts, displayedComponents: [.date,.hourAndMinute])
                
                // Add other fields for the remaining properties of the Event here
            }
            .navigationBarTitle("Game Details", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                gameManager.addEvent(event)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            })
        }
    }
}


struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameManager: GameManager(), event: Event(eventType: .game, isScrimmage: false, homeAway: .away, opponent: "Giants", location: "Reno", starts: Date(), duration: 3600, arriveEarly: 45, repeatOption: .never, notes: "Some Notes"))
        
    }
}
