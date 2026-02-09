//
//  The_Habit_TrackerApp.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 1/01/26.
//

import SwiftUI
import SwiftData

@main
struct The_Habit_TrackerApp: App {
    @State private var navigationPath = navigationFormViewModel()
    @State var vc = ViewController()
    @State private var isFirstTime: Bool = true
    
    var body: some Scene {
        WindowGroup {
            Group { 
                if isFirstTime {
                    NavigationStack(path: $navigationPath.path) {
                        WelcomeFirstView()
                            .navigationDestination(for: FormRoute.self) { Hashable in
                                switch Hashable{
                                case .AccountFormView:
                                    AccountFormSecondView()
                                case .GoalFormView:
                                    GoalsFormView()
                                case .HabitFormView:
                                    AddHabitsView()
                                case .HomeView:
                                    HomeTabView()
                                }
                            }
                    }
                } else {
                    HomeTabView()
                }
            }
            .environment(vc)
            .environment(navigationPath)
        }
    }
}
