//
//  PlayerManager.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import Foundation

class PlayerManager: ObservableObject {
    @Published var players: [Player] = []

    private let userDefaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init() {
        loadPlayers()
    }

    func addPlayer(_ player: Player) {
        players.append(player)
        savePlayers()
    }

    func deletePlayer(at indexSet: IndexSet) {
        players.remove(atOffsets: indexSet)
        savePlayers()
    }

    func editPlayer(_ player: Player) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index] = player
            savePlayers()
        }
    }

    func loadPlayers() {
        if let data = userDefaults.data(forKey: "players"),
           let savedPlayers = try? decoder.decode([Player].self, from: data) {
            self.players = savedPlayers
        }
    }

    func savePlayers() {
        if let data = try? encoder.encode(players) {
            userDefaults.set(data, forKey: "players")
        }
    }
}
