//
//  addHabitsView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 6/01/26.
//
import Foundation
import SwiftUI


struct AddHabitsView: View {
    @State var firstAnimation: Bool = false
    @State private var showAddHabit: Bool = false
    @Environment(ViewController.self) private var vc
    @Environment(navigationFormViewModel.self) private var navigation
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    navigation.goToHome()
                } label: {
                    Text("Go to Home")
                        .foregroundStyle(.green)
                        .frame(width: 110, height: 30)
                        .background(.green.opacity(0.3))
                        .cornerRadius(500)
                }.padding()
            }
        }
        ScrollView {
            ForEach(vc.goals.enumerated(), id: \.element.id) {
                index,
                goal in
                VStack{
                    goalHeader(goal.name)
                    
                    ForEach(vc.goals[index].habits) { habit in
                        HabitRow(title: habit.name)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(.gray.opacity(0.1))
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    
                    
                    HStack{
                        Button {
                            showAddHabit.toggle()
                           
                        } label: {
                            HStack{
                                Image(systemName: "plus")
                                    .font(.system(size: 30))
                                    .foregroundStyle(Color.green)
                                    .frame(width: 50, height: 50)
                                    .background(Color.green.opacity(0.1))
                                
                                Text ("Create New")
                                    .padding(10)
                                    .foregroundStyle(Color.black)
                                
                            }.background(Color.green.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }.sheet(isPresented: $showAddHabit) {
                            AddHabitSheetView(index: index, showSheet: $showAddHabit)
                        }
                        
                        Button {
                            if  goal.habits.isEmpty {
                                
                            } else {
                                vc.deletaLastHabitInput(id: goal.id, forGoalIndex: index)
                            }
                        } label: {
                            HStack{
                                Image(systemName: "plus")
                                    .font(.system(size: 30))
                                    .foregroundStyle(Color.red)
                                    .frame(width: 50, height: 50)
                                    .background(Color.red.opacity(0.1))
                                
                                Text ("Delate Last")
                                    .padding(10)
                                    .foregroundStyle(Color.black)
                                
                            }.background(Color.red.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                }
                .padding()
                .frame(width: 380)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.black.opacity(0.1)))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }.task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation {
                firstAnimation.toggle()
                vc.fetchGoals()
            }
        }
        if firstAnimation {
            VStack{
                Text("Now is the time to make a new habit that will help you achieve your goals!")
                    .font(Font.title.bold())
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.gray.opacity(0.2))
            }.transition(.move(edge: .bottom))
            
        }
    }
    
    private func goalHeader(_ name: String) -> some View {
        Text(name)
            .font(Font.title2.bold())
            .padding()
            .frame(width: 370, height: 50)
            .background(Color.gray.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

private struct HabitRow: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .padding()
            .frame(width: 340, height: 50, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.green.opacity(0.2))
            )
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    AddHabitsView()
        .environment(ViewController.init())
        .environment(navigationFormViewModel.init())
}
