//
//  Player.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var position: String
    var battingAverage: Double
}

