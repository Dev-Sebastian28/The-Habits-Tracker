//
//  HabitsView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 12/01/26.
//
import SwiftUI

struct HabitsView: View {
    @Environment(ViewController.self) private var vc
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    sectionHeader("Goals", imageName: "circle.grid.2x2.topleft.checkmark.filled")
                    Divider().padding(.horizontal)
                    ForEach(vc.goals, id: \.id) { goal in
                        rowSection(title: goal.name, imageName: "checkmark.square.fill", buttonTitle: "Edit", iconColor: .green, strikeThrough: false)
                        Divider().padding(.leading)
                    }
                }
                .frame(minWidth: .none, idealWidth: 370, maxWidth: 370, minHeight: .none, maxHeight: 300, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black.opacity(0.05), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                buttonIcon(title: "Add Goal", icon: "list.bullet", color: .blue)
                
                VStack(alignment: .leading, spacing: 0) {
                    sectionHeader("Hábitos para hoy", imageName: "sun.max.fill")
                    Divider().padding(.horizontal)
                    ForEach(vc.goals, id: \.id) { habit in
                        rowSection(title: habit.name, imageName: "circlebadge", buttonTitle: "Start", iconColor: .orange, strikeThrough: false)
                        Divider().padding(.leading)
                    }
                }
                .frame(minWidth: .none, idealWidth: 370, maxWidth: 370, minHeight: .none, maxHeight: 300, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black.opacity(0.05), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                buttonIcon(title: "Add Goal", icon: "list.bullet", color: .blue)
                
                VStack(alignment: .leading, spacing: 0) {
                    sectionHeader("Hábitos hechos", imageName: "checkmark.circle.fill")
                    Divider().padding(.horizontal)
                    ForEach(vc.goals, id: \.id) { done in
                        rowSection(title: done.name, imageName: "checkmark.seal.fill", buttonTitle: "Cancel", iconColor: .blue, strikeThrough: true)
                        Divider().padding(.leading)
                    }
                }
                .frame(minWidth: .none, idealWidth: 370, maxWidth: 370, minHeight: .none, maxHeight: 300, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black.opacity(0.05), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea()
        .onAppear {
            vc.fetchGoals()
        }
    }
}

private func sectionHeader(_ title: String, imageName: String) -> some View {
    HStack {
        Image(systemName: "\(imageName)")
            .font(.title2)
        Text(title)
            .font(.title)
            .bold()
        Spacer()
    }.padding()
}

private func rowSection(title: String, imageName: String, buttonTitle: String, iconColor: Color, strikeThrough: Bool) -> some View {
    HStack {
        Image(systemName: "\(imageName)")
            .foregroundStyle(iconColor)

        Text(title)
            .font(.title)
            .strikethrough(strikeThrough)
        Spacer()
        Button(action: {}) {
            Text(buttonTitle)
                .frame(width: 100, height: 29)
                .background(Color(.systemBlue).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }.padding()
}

private func buttonIcon (title: String, icon: String, color: Color) -> some View {
    HStack {
        Image(systemName: icon)
        Text(title)
    }
    .foregroundStyle(color)
    .frame(width: 300, height: 40, alignment: .center)
    .background(Color(.gray).opacity(0.2))
    .cornerRadius(50)
    .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)
    .bold()
}

#Preview {
    HabitsView()
        .environment(ViewController.init())
}
