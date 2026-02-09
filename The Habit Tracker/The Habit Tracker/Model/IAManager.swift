//
//  IAManager.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 12/01/26.
//

import Foundation

//class IAManager {
//    var selectedGoals: [Goal] = []
//    var userMessage: String = ""
//    
//    func addGoalToSelectedGoals(goal: Goal) -> Void {
//        selectedGoals.append(goal)
//    }
//    
//    func removeGoalFromSelectedGoals(goal: Goal) -> Void {
//        if let index = selectedGoals.firstIndex(of: goal) {
//            _ = selectedGoals.remove(at: index)
//        }
//    }
//    
//    func addMessage(message: String?) -> Void {
//        userMessage = message ?? ""
//    }
//    
//    func postMock(goals: [Goal],message: String)  {
//        Task {
//            await apiGetMock(goals: goals, message: message)
//
//        }
//    }
//    
//    func apiGetMock(goals: [Goal],message: String) async  -> ([Goal], String) {
//        try? await Task.sleep(for: .seconds(15))
//        for ga in goals {
//            ga.status = true
//        }
//        return (goals, message)
//    }
//    
//    func applyChanges() -> Void {
//        
//    }
//    
//}
//    
//    

