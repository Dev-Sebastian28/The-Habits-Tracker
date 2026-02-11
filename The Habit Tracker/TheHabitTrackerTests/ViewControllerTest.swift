//
//  ViewControllerTest.swift
//  TheHabitTrackerTests
//
//  Created by Sebastian Garcia on 11/02/26.
//

import Testing
@testable import The_Habit_Tracker


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
    
}
