//
//  profileView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 12/01/26.
//
import SwiftUI

struct profileView: View {
    @State private var name: String = "Sebastian Garcia"
    @State private var email: String = "sebastian.garcia@gmail.com"
    @State private var showEditName: Bool = false
    @State private var showEditEmail: Bool = false
    @State private var showChangePassword: Bool = false

    var body: some View {
        List {
            // Header
            Section {
                VStack(spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 110, height: 110)
                        Image("potato")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    Text(name)
                        .font(.title2.weight(.semibold))
                    Text(email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    HStack(spacing: 12) {
                        Button {
                            showEditName = true
                        } label: {
                            Label("Editar nombre", systemImage: "pencil")
                        }
                        .buttonStyle(.bordered)

                        Button {
                            showEditEmail = true
                        } label: {
                            Label("Editar email", systemImage: "envelope")
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding(.top, 4)
                }
                .frame(maxWidth: .infinity)
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
            }

            // Account Section
            Section(header: sectionHeader(title: "Cuenta", systemImage: "person.crop.circle")) {
                HStack {
                    Label("Nombre", systemImage: "textformat")
                    Spacer()
                    Text(name)
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Label("Email", systemImage: "envelope.fill")
                    Spacer()
                    Text(email)
                        .foregroundStyle(.secondary)
                }
                Button {
                    showChangePassword = true
                } label: {
                    Label("Cambiar contraseña", systemImage: "key.fill")
                }
            }

            // Goals Section
            Section(header: sectionHeader(title: "Objetivos", systemImage: "target"), footer: Text("Administra tus metas y hábitos para mantener el progreso.")) {
                NavigationLink {
                    // Placeholder de vista de metas
                    Text("Tus metas")
                        .navigationTitle("Metas")
                } label: {
                    Label("Ver metas", systemImage: "list.bullet.rectangle")
                }
                Button {
                    // Acción para agregar meta
                } label: {
                    Label("Agregar meta", systemImage: "plus")
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $showEditName) {
            editFieldSheet(title: "Editar nombre", value: $name)
        }
        .sheet(isPresented: $showEditEmail) {
            editFieldSheet(title: "Editar email", value: $email)
        }
        .sheet(isPresented: $showChangePassword) {
            VStack(spacing: 16) {
                Image(systemName: "key.fill").font(.largeTitle)
                Text("Cambiar contraseña").font(.title3.weight(.semibold))
                Text("Esta es una vista de ejemplo para cambiar tu contraseña.")
                    .foregroundStyle(.secondary)
                Button("Cerrar") { showChangePassword = false }
                    .buttonStyle(.borderedProminent)
            }
            .padding()
            .presentationDetents([.medium])
        }
    }

    // MARK: - Subviews

    private func sectionHeader(title: String, systemImage: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage)
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .textCase(nil)
    }

    private func editFieldSheet(title: String, value: Binding<String>) -> some View {
        NavigationStack {
            Form {
                TextField(title, text: value)
                    .textInputAutocapitalization(.words)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Hecho") { UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) }
                }
            }
        }
    }
}

#Preview {
    profileView()
}
