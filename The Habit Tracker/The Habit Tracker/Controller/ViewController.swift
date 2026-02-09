//
//  ViewController.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 10/01/26.
//

import Foundation
import Observation


@Observable
class ViewController {
    var managerModel = ManagerModel()
    var goals: [Goal] = []
    var userData: UserInfModel = .init(email: "", password: "", username: "", userAage: nil, userCountry: nil, userOccupation: nil, isPremium: nil, userImage: nil)
    
    func fetchGoals() {
        let delegate = FetchGoalViewController()
        self.goals = delegate.fetchGoals(managerModel: &managerModel)
    }
    
    func fetchUserData() {
        let delegate = FetchUserDataViewController()
        self.userData = delegate.fetchUserData(managerModel: &managerModel)
    }
    
    func addGoalInput(name: String, description: String, endDate: Date?) {
        let delegate = AddGoalViewController()
        delegate.addGoal(name: name, description: description, endDate: endDate, managerModel: &managerModel)
        goals = managerModel.goals
        fetchUserData()
        
        
    }
    
    func updateGoalInput(id: UUID, name: String, description: String, endDate: Date?, forGoal: Goal) {
        let delegate = UpdateGoalViewController()
        delegate.updateGoal(name: name, description: description, endDate: endDate, managerModel: &managerModel, goal: forGoal)
        goals = managerModel.goals
        
    }
    
    func deleteGoalInput(id: UUID, forGoal: Goal) {
        let delegate = DeleteGoalViewController()
        delegate.deleteGoal(managerModel: &managerModel, goal: forGoal)
        goals = managerModel.goals
        
    }
    
    func addHabitInput(name: String, description: String, days: [Daysofweek], forGoalIndex: Int)  {
        let delegate = AddHabitViewController()
        delegate
            .addHabit(
                name: name,
                forGoalIndex: forGoalIndex,
                forDays: days,
                managerModel: &managerModel
            )
        self.goals =  managerModel.sendGoals()
    }
    
    func updateHabitInput(oldHabit: Habit, name: String?, description: String?, days: [Daysofweek]?, forGoal: inout Goal) {
        let delegate = UpdateHabitViewController()
        delegate.updateHabit(name: name ?? oldHabit.name, description: oldHabit.description ?? "" , forDays: days ?? oldHabit.days, managerModel: &managerModel, habit: oldHabit, forGoal: &forGoal)
        goals = managerModel.goals
        
    }
    
    func deleteHabitInput(id: UUID, forGoal: inout Goal , habit: Habit) {
        let delegate = DeleteHabitViewController()
        delegate.deleteHabit(managerModel: &managerModel, habit: habit, forGoal: &forGoal)
        goals = managerModel.goals
        
    }
    
    func deletaLastHabitInput(id: UUID, forGoalIndex: Int) {
        let delegate = DeleteLastHabitViewController()
        delegate.deleteLastHabit(managerModel: &managerModel, forGoalIndex: forGoalIndex)
        goals = managerModel.goals
        
    }
    
    func deletaLastGoalInput(id: UUID) {
        let delegate = DeleteLastGoalViewController()
        delegate.deleteLastGoal(managerModel: &managerModel)
        goals = managerModel.goals
        
    }
    
    func userDataInput(
        name: String,
        email: String,
        password: String,
        userAge: String,
        userCountry: String,
        userOccupation: String,
        isPremium: Bool,
        userImage: String?) {
        let delegate = SendUserDataViewController()
        delegate
            .sendUserData(
                email: email,
                password: password,
                username: name,
                userAge: userAge,
                userCountry: userCountry,
                userOccupation: userOccupation,
                isPremium: false,
                userImage: "",
                managerModel: &managerModel
            )
    }
}




struct FetchGoalViewController {
    func fetchGoals(managerModel: inout ManagerModel) -> [Goal]  {
        managerModel.goals
    }
}

struct FetchUserDataViewController {
    func fetchUserData(managerModel: inout ManagerModel) -> UserInfModel {
        managerModel.userData
    }
}

struct AddGoalViewController {
    func addGoal(name: String, description: String, endDate: Date?, managerModel: inout ManagerModel) {
        managerModel.addGoal(name: name, description: description, endDate: endDate)
    }
}

struct UpdateGoalViewController {
    func updateGoal(name: String, description: String, endDate: Date?, managerModel: inout ManagerModel, goal: Goal) {
        managerModel.updateGoal(id: goal.id, name: name, description: description, endDate: endDate)
    }
}

struct DeleteGoalViewController {
    func deleteGoal(managerModel: inout ManagerModel, goal: Goal) {
        managerModel.removeGoal(id: goal.id)
    }
}


struct AddHabitViewController {
    func addHabit(name: String, forGoalIndex:  Int, forDays: [Daysofweek] ,managerModel: inout ManagerModel) {
        managerModel.addHabit(name: name, description: "", days: forDays, forGoal: &managerModel.goals[forGoalIndex])
    }
}

struct DeleteHabitViewController {
    func deleteHabit(managerModel: inout ManagerModel, habit: Habit , forGoal: inout Goal) {
        managerModel.removeHabit(id: habit.id, forGoal: &forGoal)
    }
}

struct UpdateHabitViewController {
    func updateHabit(name: String, description: String, forDays: [Daysofweek], managerModel: inout ManagerModel, habit: Habit, forGoal: inout Goal) {
        managerModel.updateHabit(oldHabit: habit, name: name, description: description, days: forDays, forGoal: forGoal)
    }
}

struct DeleteLastHabitViewController {
    func deleteLastHabit(managerModel: inout ManagerModel, forGoalIndex: Int) {
        managerModel.removeLastHabit(goal: &managerModel.goals[forGoalIndex])
    }
}

struct DeleteLastGoalViewController {
    func deleteLastGoal(managerModel: inout ManagerModel) {
        managerModel.removeLastGoal()
    }
}

struct SendUserDataViewController {
    func sendUserData(
        email: String,
        password: String,
        username: String,
        userAge: String,
        userCountry: String,
        userOccupation: String,
        isPremium: Bool,
        userImage: String,
        managerModel: inout ManagerModel
    ) {
        managerModel
            .updateUserData(
                name: username,
                age: userAge,
                country: userCountry,
                occupation: userOccupation,
                email: email,
                password: password
            )
        
    }
}
