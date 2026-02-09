//
//  GoalsModel.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 1/01/26.
//

import Foundation

enum Status: Equatable {
    case inProgress
    case completed
    case paused
    case none
    
}

struct Goal: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var description: String?
    var startDate: Date
    var endDate: Date?
    var status: Status
    var progress: Int?
    var habits: [Habit] = []
    
    init(name: String, description: String?, endDate: Date?) {
        self.id = .init()
        self.name = name
        self.description = description
        self.startDate = .now
        self.endDate = endDate
        self.status = .inProgress
        self.progress = nil
    }
    
}








