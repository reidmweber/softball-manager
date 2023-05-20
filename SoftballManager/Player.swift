//
//  Player.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import Foundation

struct Player: Identifiable, Codable {
 var id = UUID()
 var jerseyNumber: Int
 var email: String
 var firstName: String
 var lastName: String
 var preferredPosition: String
 var battingAverage: Double
}

