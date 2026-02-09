//
//  CoachView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 12/01/26.
//
import SwiftUI

struct CoachView: View {
    @State private var searchText: String = ""

    struct CoachItem: Identifiable, Hashable {
        let id = UUID()
        let name: String
        let age: Int
        let skills: String
        let languages: String
        let ratePerHour: String
        let icon: String
    }

    private var items: [CoachItem] = [
        .init(name: "María López", age: 29, skills: "iOS, SwiftUI, Combine", languages: "Español, Inglés", ratePerHour: "$70 / hr", icon: "person.fill"),
        .init(name: "Juan Pérez", age: 34, skills: "Backend, Vapor, Swift", languages: "Español", ratePerHour: "$55 / hr", icon: "laptopcomputer"),
        .init(name: "Ana García", age: 31, skills: "UI/UX, Prototyping", languages: "Inglés", ratePerHour: "$65 / hr", icon: "paintbrush.fill"),
        .init(name: "Carlos Díaz", age: 27, skills: "iOS, Testing", languages: "Español, Inglés", ratePerHour: "$60 / hr", icon: "wrench.and.screwdriver.fill")
    ]

    var body: some View {
        VStack(spacing: 16) {
            // Search Bar
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                TextField("Buscar habilidades", text: $searchText)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            .padding(12)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(.horizontal)

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(filteredItems) { item in
                        coachCard(for: item)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical, 8)
            }
        }
    }

    private var filteredItems: [CoachItem] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !query.isEmpty else { return items }
        return items.filter { item in
            item.name.lowercased().contains(query) ||
            item.skills.lowercased().contains(query) ||
            item.languages.lowercased().contains(query)
        }
    }

    @ViewBuilder
    private func coachCard(for item: CoachItem) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 16) {
                // Avatar with icon replacing the plain Circle
                ZStack {
                    Circle()
                        .fill(Color(.secondarySystemBackground))
                        .frame(width: 72, height: 72)
                    Image(systemName: item.icon)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.black)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("\(item.age) años")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(item.skills)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(item.languages)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text(item.ratePerHour)
                    .font(.headline)
                    .foregroundStyle(.green)
            }

            HStack(spacing: 12) {
                Button {
                    // Acción de contactar
                } label: {
                    Label("Contactar", systemImage: "paperplane.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Button {
                    // Acción de más información
                } label: {
                    Label("Más info", systemImage: "info.circle")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(16)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    CoachView()
}
