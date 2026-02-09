//
//  TheHabitTrackerTests.swift
//  TheHabitTrackerTests
//
//  Created by Sebastian Garcia on 6/01/26.
//

import Testing
@testable import The_Habit_Tracker

struct TheHabitTrackerTests {
    
}

struct ManagerTests {
    var manager = ManagerModel()
    
    @Test
    func addGoal() {
        try? #require(manager.goals.isEmpty)
        manager.addGoal(name: "test", description: "test", endDate: .none)
        let goalTest = manager.goals[0]
        #expect(manager.goals.contains(where: { Goal in
            Goal.id == goalTest.id
        }))
    }
    
    
    @Test
    func removeGoal(){
        manager.addGoal(name: "", description: "", endDate: nil)
        try? #require(manager.goals.count == 1)
        let goal = manager.goals[0]
        manager.removeGoal(id: goal.id)
        #expect(manager.goals.count == 0)
    }
    
    @Test
    func updateGoal() {
        manager.addGoal(name: "", description: "", endDate: .none)
        try? #require(manager.goals.count == 1)
        let oldGoal = manager.goals[0]
        manager.updateGoal(id: manager.goals[0].id, name: "New", description: "", endDate: .none)
        #expect(manager.goals[0].id == oldGoal.id)

    }
    
    @Test
    func addHabit() {
        manager.addGoal(name: "", description: "", endDate: .none)
        try? #require(manager.goals.count == 1)
        manager.addHabit(name: "", description: "", days: .init(), forGoal: &manager.goals[0])
        #expect(manager.goals.first?.habits.count == 1)
    }
    @Test
    func removeHabit(){
        manager.addGoal(name: "", description: "", endDate: .none)
        try? #require(manager.goals.count == 1)
        manager.addHabit(name: "", description: "", days: .init(), forGoal: &manager.goals[0])
        try? #require(manager.goals[0].habits.count == 1)
        let habit = manager.goals[0].habits[0]
        manager.removeHabit(id: habit.id, forGoal: &manager.goals[0])
        #expect(manager.goals[0].habits.count == 0)
    }
    
    @Test
    func updateHabit() {
        manager.addGoal(name: "", description: "", endDate: .none)
        try? #require(manager.goals.count >= 1)
        manager.addHabit(name: "", description: "", days: .init(), forGoal: &manager.goals[0])
        let oldHabit = manager.goals[0].habits[0]
        manager.updateHabit(oldHabit: oldHabit, name: "New Name", description: "New Description", days: .init(), forGoal: manager.goals[0])
        #expect(manager.goals[0].habits[0].id == oldHabit.id)
    }
}

struct ViewControllerTests {
    var viewController = ViewController()
    
    @Test
    func addGoalInput() {
        try? #require(viewController.managerModel.goals.isEmpty)
        try? #require(viewController.goals.isEmpty)
        viewController.addGoalInput(name: "Test Goal", description: "This is a test goal", endDate: nil )
        #expect(viewController.goals.count == 1)
        #expect(viewController.managerModel.goals.count == 1)
    }
    
    @Test
    @MainActor func addHabitInput() async {
        viewController
            .addGoalInput(
                name: "Test Goal",
                description: "This is a test goal",
                endDate: nil
            )
        await viewController
            .addHabitInput(
                name: "test",
                description: "test",
                days: [.friday],
                forGoal: &viewController.managerModel.goals[0]
            )
        #expect(viewController.managerModel.goals[0].habits.count == 1)
        #expect(viewController.goals[0].habits.count == 1)
    }
}

