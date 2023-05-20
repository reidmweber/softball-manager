//
//  GameManager.swift
//  SoftballManager
//
//  Created by Reid Weber on 5/19/23.
//

import Foundation

class GameManager: ObservableObject {
    @Published var events = [Event]()
    
    private let userDefaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        loadEvents()
    }

    func addEvent(_ event: Event) {
        events.append(event)
        saveEvents()
    }

    func removeEvent(_ event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events.remove(at: index)
            saveEvents()
        }
    }

    func updateEvent(_ event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
            saveEvents() 
        }
    }
    
    func loadEvents() {
        if let data = userDefaults.data(forKey: "events"),
           let savedEvents = try? decoder.decode([Event].self, from: data) {
            self.events = savedEvents
        }
    }
    
    func saveEvents() {
        if let data = try? encoder.encode(events) {
            userDefaults.set(data, forKey: "events")
        }
    }
}
