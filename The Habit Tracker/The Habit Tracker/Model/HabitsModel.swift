//
//  HabitsModel.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 1/01/26.
//

import Foundation

enum Daysofweek {
    case monday, tuesday, wednesday, thursday, friday, sunday, saturday
}


struct Habit:Identifiable ,Equatable {
    var id : UUID
    var description: String?
    var days: [Daysofweek]
    var name: String
    var Status: Status
    var forGoal: Goal
    
    init(id:UUID ,name: String, description: String?, days: [Daysofweek],forGoal: Goal) {
        self.id = id
        self.description = description
        self.days = days
        self.name = name
        self.Status = .none
        self.forGoal = forGoal
    }
}



