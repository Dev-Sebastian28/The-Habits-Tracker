//
//  AddGoalSheetView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 10/01/26.
//
import SwiftUI
import Foundation

struct AddGoalSheetView:View {
    @Environment(ViewController.self) private var vc
    @Binding var showSheet: Bool
    @State private var startDate: Date = .now
    @State private var endDate: Date = .now
    @State private var goalTitle: String = ""
    @State private var goalDescription: String = ""
    private var isValid: Bool { !goalTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    
    var body: some View {
        ZStack {
            // Background gradient
            
            
            VStack(spacing: 24) {
                // Header
                HStack{
                    
                    Text("Create a New Goal")
                        .font(.largeTitle).bold()
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Main card
                VStack(spacing: 20) {
                    // Title field
                    HStack(alignment: .top, spacing: 12) {
                        
                        TextField("", text: $goalTitle, prompt: Text("  Goal Name"), axis: .vertical)
                            .frame(minWidth: 300, idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, idealHeight: 50, maxHeight: .infinity)
                            .background(.green.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    }
                    
                    // Description field
                    HStack(alignment: .top, spacing: 12) {
                        
                        TextField("", text: $goalDescription, prompt: Text("  Optional Description"), axis: .vertical)
                            .frame(minWidth: 300, idealWidth: .infinity, maxWidth: .infinity, minHeight: 40, idealHeight: 50, maxHeight: .infinity)
                            .background(.green.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        
                    }
                    
                    // Dates section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "calendar")
                                .foregroundStyle(.secondary)
                            Text("When do you want to achieve this goal?")
                                .font(.headline)
                        }
                        HStack(spacing: 24) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Start Date").font(.caption).foregroundStyle(.secondary)
                                DatePicker("", selection: $startDate, displayedComponents: [.date])
                                    .labelsHidden()
                                    .datePickerStyle(.compact)
                            }
                            VStack(alignment: .leading, spacing: 6) {
                                Text("End Date").font(.caption).foregroundStyle(.secondary)
                                DatePicker("", selection: $endDate, in: startDate..., displayedComponents: [.date])
                                    .labelsHidden()
                                    .datePickerStyle(.compact)
                            }
                        }
                    }
                    .padding(14)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.15), lineWidth: 1)
                    )
                    
                    // Actions
                    HStack(spacing: 16) {
                        Button {
                            vc.addGoalInput(name: goalTitle, description: goalDescription, endDate: endDate)
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


