//
//  RosterView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct RosterView: View {
    @EnvironmentObject var playerManager: PlayerManager
    @State private var isShowingPlayerEditView = false


  var body: some View {
      NavigationStack {
          List {
              ForEach(playerManager.players) { player in
                  NavigationLink(destination: PlayerEditView(player: player ,isPresented: $isShowingPlayerEditView)) {
                      PlayerRowView(player: player)
                  }
              }
              .onDelete(perform: playerManager.deletePlayer)
          }
          .navigationBarTitle("Team Roster")
          .toolbar {
              ToolbarItem(placement: .navigationBarTrailing){
                  HStack{
                      Button(action: {
                          isShowingPlayerEditView = true
                      }) {
                          Image(systemName: "plus.circle.fill")
                              .resizable()
                              .frame(width: 40, height: 40)
                              .foregroundColor(.blue)
                          
                      }
                      
                  }
              }
          }
          
          .sheet(isPresented: $isShowingPlayerEditView) {
              PlayerEditView(player: nil, isPresented: $isShowingPlayerEditView)
                  .environmentObject(playerManager)
          }
      }
  }
}

struct RosterView_Previews: PreviewProvider {
    
  static var previews: some View {
    RosterView()
          .environmentObject(PlayerManager())
  }
}
