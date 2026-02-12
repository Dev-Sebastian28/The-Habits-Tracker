//
//  GoalsFormView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 10/01/26.
//
import SwiftUI


struct GoalsFormView: View {
    @Environment(navigationFormViewModel.self) private var navigation
    @Environment(ViewModel.self) private var vc
    @State private var addGoalSheet: Bool = false
    @State private var animation: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("\(vc.managerModel.userData.username) lets start with your goals!, tell me what you want to achieve!")
                    .font(.title)
                    .frame(width: 300, height: 140)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .bold()
                if !vc.goals.isEmpty {
                    Image("potatoLarge")
                } else {
                    
                }
            }
            ForEach(vc.goals, id: \.id) { goal in
                Button {
                    print("Tapped goal: \(goal.name)")
                } label: {
                    HStack(alignment: .center, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(goal.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                                .lineLimit(1)
                            if let desc = goal.description, !desc.isEmpty {
                                Text(desc)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                            }
                            HStack(spacing: 8) {
                                Label {
                                    Text(goal.startDate, style: .date)
                                } icon: {
                                    Image(systemName: "calendar")
                                }
                                .labelStyle(.titleAndIcon)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                if let end = goal.endDate {
                                    Text("–")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    Text(end, style: .date)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.tertiary)
                    }
                    .padding(14)
                    .frame(maxWidth: 360)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.ultraThinMaterial))
                }
                .buttonStyle(.plain)
            }
            .transition(.move(edge: .top))
            .padding(.top, -5)
        }
        
        
        HStack {
            
            Button {
                addGoalSheet.toggle()
                
            } label: {
                Text("Create")
                    .font(.largeTitle)
                    .frame(width: 140, height: 50)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
            }.sheet(isPresented: $addGoalSheet){
                withAnimation(.linear(duration: 10)) {
                    AddGoalSheetView(showSheet: $addGoalSheet)
                    
                }
            }
            
            Button {
                if vc.goals.isEmpty {
                    
                } else {
                    vc.deletaLastGoalInput(id: vc.goals.last!.id)
                }
            } label: {
                Text("Delete")
                    .font(.largeTitle)
                    .frame(width: 140, height: 50)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
            }
            
            Button {
                navigation.goToHabitFormView()
            } label: {
                Text("Next")
                    .font(.largeTitle)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    GoalsFormView()
        .environment(ViewModel.init())
        .environment(navigationFormViewModel.init())
}
