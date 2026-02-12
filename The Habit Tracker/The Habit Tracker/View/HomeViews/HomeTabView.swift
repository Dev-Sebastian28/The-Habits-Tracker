//
//  HomeView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 1/01/26.
//

import Foundation
import SwiftUI


struct HomeTabView: View {
    var manager = ManagerModel()
    var body: some View {
        TabView {
            
            Tab("Habits", systemImage: "list.bullet") {
                HabitsView()
            }
            .badge(0)
            
            Tab("AI", systemImage: "i.square") {
                AIView()
            }
            .badge("!")
            
            Tab("Coaching", systemImage: "figure.stand.line.dotted.figure.stand") {
                CoachView()
            }
            .badge("!")
            
            Tab("Account", systemImage: "person.crop.circle.fill") {
                profileView()
            }
        }
    }
}




#Preview {
    HomeTabView()
        .environment(ViewModel.init())
}
