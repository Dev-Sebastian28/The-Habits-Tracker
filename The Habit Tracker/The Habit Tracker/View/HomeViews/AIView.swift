//
//  AIview.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 12/01/26.
//
import SwiftUI

struct AIView: View {
    @Environment(ViewController.self) private var vc
    @State var isFirstTime: Bool = false
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    @State var selectedHabits: [UUID] = []
    
    func isInSelectedHabits(id: UUID) -> Bool{
        return selectedHabits.contains { UUID in
            return UUID == id
        }
    }

    
    var body: some View {
        NavigationStack {
            ZStack {
                if isFirstTime {
                    FirstTimeIAView()
                } else {
                    VStack {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 24) {
                        

                                ForEach(vc.goals) { goal in
                                    Button {
                                        if let index = selectedHabits.firstIndex(of: goal.id) {
                                            selectedHabits.remove(at: index)
                                        } else {
                                            selectedHabits.append(goal.id)
                                        }
                                        print(selectedHabits)
                                    } label: {
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text(goal.name.capitalized)
                                                .font(.title2.bold())
                                                .lineLimit(2)
                                                .minimumScaleFactor(0.8)

                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, minHeight: 160)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .fill(
                                                    isInSelectedHabits(id: goal.id)
                                                    ? LinearGradient(colors: [Color.blue.opacity(0.35)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                    : LinearGradient(colors: [Color.blue.opacity(0.15)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                )
                                        )
                                        .overlay(
                                            
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .strokeBorder(Color.black.opacity(0.05), lineWidth: 1)
                                        )
                                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 6)
                                        .foregroundStyle(
                                            isInSelectedHabits(id: goal.id) ? Color.primary : Color.primary
                                        )
                                        .overlay(alignment: .topTrailing) {
                                            if isInSelectedHabits(id: goal.id) {
                                                HStack(alignment: .firstTextBaseline) {
                                                    HStack(spacing: 0) {
                                                        Image(systemName: "checkmark.circle.fill")
                                                            .foregroundStyle(.green)
                                                    }
                                                    .padding(.vertical, 6)
                                                    .padding(.horizontal, 10)
                                                    .background(.ultraThinMaterial, in: Capsule())
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Send to AI")
                                .font(Font.title.bold())
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)

                        }
                        
                    }.onAppear {
                        vc.fetchGoals()
                    }
                }
            }
        }
    }
}


#Preview {
    
    AIView()
        .environment(ViewController.init())
    
}

