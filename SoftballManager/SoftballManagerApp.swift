//
//  SoftballManagerApp.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import SwiftUI

@main
struct SoftballManagerApp: App {
    @StateObject var playerManager = PlayerManager()
    
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(playerManager)
                .environmentObject(GameManager())
        }
    }
}
