//
//  PlayerEditView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct PlayerEditView: View {
    @EnvironmentObject var playerManager: PlayerManager
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    
    @State private var email: String
    @State private var firstName: String
    @State private var lastName: String
    @State private var preferredPosition: String
    @State private var battingAverage: Double {
        didSet {
            battingAverageString = String(battingAverage)
        }
    }
    @State private var battingAverageString: String {
        didSet {
            battingAverage = Double(battingAverageString) ?? 0.0
        }
    }
    @State private var jerseyNumber: Int {
        didSet {
            jerseyNumberString = String(jerseyNumber)
        }
    }
    @State private var jerseyNumberString: String {
        didSet {
            jerseyNumber = Int(jerseyNumberString) ?? 0
        }
    }
    private var player: Player?
    
    // Initialize with a player for editing, or without for adding
    init(player: Player? = nil, isPresented: Binding<Bool>) {
        self.player = player
        _firstName = State(initialValue: player?.firstName ?? "")
        _lastName = State(initialValue: player?.lastName ?? "")
        _email = State(initialValue: player?.email ?? "")
        _jerseyNumber = State(initialValue: player?.jerseyNumber ?? 0)
        _jerseyNumberString = State(initialValue: String(player?.jerseyNumber ?? 0))
        _preferredPosition = State(initialValue: player?.preferredPosition ?? "")
        _battingAverage = State(initialValue: player?.battingAverage ?? 0.0)
        _battingAverageString = State(initialValue: String(player?.battingAverage ?? 0.0))
        _isPresented = isPresented
    }

    var body: some View {
        VStack{
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                TextField("Jersey Number", text: $jerseyNumberString)
                TextField("Preferred Position", text: $preferredPosition)
                TextField("Batting Average", text: $battingAverageString)
                // Add other fields as necessary
            }
            HStack {
                Spacer()
                Button("Save") {
                    savePlayer()
                }
                Spacer()
                Button("Cancel") {
                    cancelEdit()
                }
                Spacer()
            }
        }
        .navigationBarTitle(player == nil ? "Add Player" : "Edit Player")
    }
    
    private func savePlayer() {
        let updatedPlayer = Player(
            id: player?.id ?? UUID(),
            jerseyNumber: editedJerseyNumber,
            email: email,
            firstName: firstName,
            lastName: lastName,
            preferredPosition: preferredPosition,
            battingAverage: editedBattingAverage
        )
        
        if player != nil {
            playerManager.editPlayer(updatedPlayer)
        } else {
            playerManager.addPlayer(updatedPlayer)
        }
        
        // Dismiss the view
        cancelEdit()
    }
    
    private var editedJerseyNumber: Int {
         Int(jerseyNumberString) ?? 0
     }

     private var editedBattingAverage: Double {
         Double(battingAverageString) ?? 0.0
     }
    
    private func cancelEdit() {
        isPresented = false
        presentationMode.wrappedValue.dismiss()
    }
}



struct PlayerEditView_Previews: PreviewProvider {
    @State static private var isShowingPlayerEditView = true
    static var previews: some View {
        PlayerEditView(player: nil, isPresented: $isShowingPlayerEditView )
            .environmentObject(PlayerManager())
    }
}
