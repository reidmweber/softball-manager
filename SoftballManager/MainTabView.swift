//
//  MainTabView.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var playerManager: PlayerManager
    var body: some View {
        TabView {
            RosterView()
                .tabItem {
                    Label("Team Roster", systemImage: "person.3")
                }
                .environmentObject(playerManager)
            
            GameScheduleView()
                .tabItem {
                    Label("Game Schedule", systemImage: "calendar")
                }
            
            GameStrategyView()
                .tabItem {
                    Label("Game Strategy", systemImage: "lightbulb")
                }
            
            PlayerStatsView()
                .tabItem {
                    Label("Player Stats", systemImage: "chart.bar")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
