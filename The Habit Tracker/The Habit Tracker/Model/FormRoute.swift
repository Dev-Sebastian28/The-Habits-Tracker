//
//  FormRoute.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 6/01/26.
//

import Foundation
import Observation
import SwiftUI

enum FormRoute: Hashable {
    case AccountFormView
    case GoalFormView
    case HabitFormView
    case HomeView
}

@Observable
class navigationFormViewModel {
    var path = NavigationPath()
    
    func goToAccountFormView() {
        path.append(FormRoute.AccountFormView)
    }
    
    func goToGoalFormView() {
        path.append(FormRoute.GoalFormView)
    }
    
    func goToHabitFormView() {
        path.append(FormRoute.HabitFormView)
    }
    
    func goToHome() {
        path.append(FormRoute.HomeView)
    }
}
