//
//  AddHabitSheetView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 10/01/26.
//
import SwiftUI


struct AddHabitSheetView:View {
    let daysofWeek: [(String, Daysofweek)] = [("Monday", .monday), ("Tuesday", .tuesday), ("Wednesday", .wednesday), ("Thursday", .thursday), ("Friday", .friday), ("Saturday", .saturday), ("Sunday", .sunday)]
    @Environment(ViewController.self) private var vc
    @State var index: Int
    @Binding var showSheet: Bool
    @State private var habitName: String = ""
    @State private var habitDescription: String = ""
    @State private var selectedDays: Set<Daysofweek> = []
    private var isValid: Bool { !habitName.isEmpty }
    
    var body: some View {
        ZStack {
            // Background gradient
            
            
            VStack(spacing: 24) {
                // Header
                HStack{
                    
                    Text("Create a New Habit")
                        .font(.largeTitle).bold()
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Main card
                VStack(spacing: 20) {
                    // Title field
                    HStack(alignment: .top, spacing: 12) {
                        
                        TextField("", text: $habitName, prompt: Text("  Habit Name"), axis: .vertical)
                            .frame(minWidth: 300, idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, idealHeight: 50, maxHeight: .infinity)
                            .background(.green.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    }
                    
                    // Description field
                    HStack(alignment: .top, spacing: 12) {
                        
                        TextField("", text: $habitDescription, prompt: Text("  Optional Description"), axis: .vertical)
                            .frame(minWidth: 300, idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, idealHeight: 50, maxHeight: .infinity)
                            .background(.green.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(daysofWeek, id: \.0) { tuple in
                                let label = tuple.0
                                let day = tuple.1
                                Button {
                                    if selectedDays.contains(day) {
                                        selectedDays.remove(day)
                                    } else {
                                        selectedDays.insert(day)
                                    }
                                } label: {
                                    Text(label)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .frame(width: 70, height: 36)
                                        .background(selectedDays.contains(day) ? Color.blue : Color.gray)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                    
                    
                    
                    
                    // Actions
                    HStack(spacing: 16) {
                        Button {
                            vc.addHabitInput(name: habitName, description: habitDescription, days: Array(selectedDays), forGoalIndex: index)
                            showSheet.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Create")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isValid ? Color.green : Color.gray.opacity(0.5))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .shadow(color: .green.opacity(isValid ? 0.3 : 0), radius: 10, x: 0, y: 6)
                        }
                        .disabled(!isValid)
                        
                        Button {
                            showSheet.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "xmark")
                                Text("Cancel")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.15))
                            .foregroundStyle(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                    }
                }
                .padding(20)
                //  .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 10)
                .padding(.horizontal)
                
                Spacer(minLength: 12)
            }
        }
    }
}
