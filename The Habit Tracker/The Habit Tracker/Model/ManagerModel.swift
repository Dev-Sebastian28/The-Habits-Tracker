//
//  ManagerModel.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 1/01/26.
//

import Foundation

protocol ManagerHabilitys {
    func addGoal(name: String, description: String, endDate: Date?)
    func removeGoal(id: UUID)
    func updateGoal(id: UUID, name: String, description: String, endDate: Date?)
    
    func addHabit(name: String, description: String, days: [Daysofweek], forGoal: inout Goal)
    func removeHabit(id: UUID, forGoal: inout Goal)
    func updateHabit(oldHabit: Habit, name: String?, description: String?, days: [Daysofweek]?, forGoal: Goal)
    func removeLastGoal()
    func removeLastHabit(goal: inout Goal)
    func sendGoals()  -> [Goal]
}


public class ManagerModel: ManagerHabilitys {
    

    var userData: UserInfModel = .init(
        email: "",
        password: "",
        username: "",
        userAage: "",
        userCountry: "",
        userOccupation: "",
        isPremium: nil,
        userImage: nil
    )
    
    var goals: [Goal] = []
    
    func updateUserData(name: String, age: String, country: String, occupation: String, email: String, password: String) {
        userData = .init(
            email: email,
            password: password,
            username: name,
            userAage: age,
            userCountry: country,
            userOccupation: occupation,
            isPremium: nil,
            userImage: nil
        )
    }
    
    func sendGoals()  -> [Goal] {
        return goals
    }
    
    func addGoal(name: String, description: String, endDate: Date?) {
        let delegate = AddGoalManager()
        delegate.addGoal(goal: .init(name: name, description: description, endDate: endDate), list: &goals)
    }
    
    
    func removeGoal(id: UUID) {
        let delegate = RemoveGoalManager()
        delegate.removeGoal(lid: id, list: &goals)
    }
    
    
    func updateGoal(id: UUID, name: String, description: String, endDate: Date?) {
        let delegate = UpdateGoalManager()
        delegate.updateGoal(id: id, newGoal: .init(name: name, description: description, endDate: endDate), list: &goals)
    }
    
    
    func addHabit(name: String, description: String, days: [Daysofweek], forGoal: inout Goal) {
        let delegate = AddHabitsManager()
        delegate.addHabit(name: name, description: description, days: days, forGoal: &forGoal)
    }
    
    
    func removeHabit(id: UUID, forGoal: inout Goal) {
        let delegate = RemoveHabitsManager()
        delegate.removeHabit(habitId: id, forGoal: &forGoal)
    }
    
    
    func updateHabit(oldHabit: Habit, name: String?, description: String?, days: [Daysofweek]?, forGoal: Goal) {
        let delegate = UpdateHabitsManger()
        var newHabit = Habit(id: oldHabit.id, name: name ?? oldHabit.name, description: description ?? oldHabit.description, days: days ?? oldHabit.days, forGoal: oldHabit.forGoal)
        delegate.updateHabit(oldHabit: oldHabit, newHabit: newHabit, forGoal: &newHabit.forGoal)
    }
    
    func removeLastGoal() {
        let delegate = RemoveLastGoalManager()
        delegate.removeLastGoal(list: &goals)
    }
    
    func removeLastHabit(goal: inout Goal) {
        goal.habits.removeLast()
    }
    init() {
        addGoal(name: "Run a marathon", description: "i want to run a marathon in 2025", endDate: nil)
        addHabit(name: "Run 5km", description: "i want to run 5km every day", days: [.monday, .tuesday, .wednesday, .thursday, .friday], forGoal: &goals[0])
        addGoal(name: "Read a book", description: "i want to read a book every month", endDate: nil)
        addHabit(name: "Read 100 pages", description: "i want to read 100 pages every week", days: [.sunday, .monday, .tuesday, .wednesday, .thursday, .saturday], forGoal: &goals[1])
        addGoal(name: "Learn a new language", description: "i want to learn a new language every month", endDate: nil)
        addHabit(name: "Learn 10 words", description: "i want to learn 10 words every day", days: [.monday, .wednesday, .friday], forGoal: &goals[2])
    }
}

// MARK: - Structs to work with Goals List in ManagerModel



struct RemoveGoalManager{
    func removeGoal(lid: UUID, list: inout [Goal]){
        list.removeAll(where: { $0.id == lid })
    }
}

struct AddGoalManager{
    func addGoal(goal: Goal, list: inout [Goal]) {
        list.append(goal)
    }
}

struct UpdateGoalManager{
    func updateGoal(id: UUID, newGoal: Goal, list: inout [Goal]) {
        if let index = list.firstIndex(where: {$0.id == id}) {
            list[index] = newGoal
            list[index].id = id
        }
    }
}

// MARK: - Structs to work with Habits in ManagerModel

struct AddHabitsManager{
    func addHabit(name: String, description: String, days: [Daysofweek], forGoal: inout Goal){
        let newHabit = Habit(id: .init(), name: name, description: description, days: days, forGoal: forGoal)
        forGoal.habits.append(newHabit)
    }
}

struct RemoveHabitsManager{
    func removeHabit(habitId: UUID, forGoal: inout Goal){
        if let index = forGoal.habits.firstIndex(where: {$0.id ==  habitId}) {
            forGoal.habits.remove(at: index)
        }
    }
}

struct UpdateHabitsManger{
    func updateHabit(oldHabit: Habit, newHabit: Habit, forGoal: inout Goal){
        if let index = forGoal.habits.firstIndex(where: {$0.id ==  oldHabit.id}) {
            forGoal.habits[index].name = newHabit.name
            forGoal.habits[index].days = newHabit.days
            if let newDescription = newHabit.description {
                forGoal.habits[index].description = newDescription
            }
            
        }
    }
}

struct RemoveLastGoalManager{
    func removeLastGoal(list: inout [Goal]){
        list.removeLast()
    }
}


