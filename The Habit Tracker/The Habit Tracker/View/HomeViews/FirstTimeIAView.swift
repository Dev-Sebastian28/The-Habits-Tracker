//
//  FirstTimeIAView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 12/01/26.
//
import SwiftUI

struct FirstTimeIAView: View {
                var body: some View {
                    VStack(spacing:0) {
                        Spacer(minLength: 70)
                        VStack {
                            Text("Welcome to IA habit tracker analyst")
                                .font(Font.title)
                                .fontWeight(Font.Weight.bold)
                                .foregroundStyle(Color(.systemBlue))
                            Text("Here the IA will analyses your goals and habits, then it will check your habits of each goal selected and send you a better version of your habits.")
                            
                            Text("For a better results:")
                                .font(.title)
                                .foregroundStyle(Color(.brown))
                            
                            Text("1 .create a description for each goal and habit, so they have a meaning, and make sure they are clear and specific")
                            
                            Text("2. if you have goals that are relative to each other, try to select them all at once, and it will try to analyses them")
                            
                            Text("3. The more habits you have, the better the analysis will be")
                            
                            Text("4. Check the end date of your goals and the days of your habits, and make sure they are correct")
                            
                            Text("IMPORTANT: Sometimes it may take a while to get the analysis, so be patient and don't worry ")
                            
                            Text("IMPORTANT: Sometimes the result may not be 100% accurate, but it will give you a better version of your habits")
                            
                        }
                        .padding()
                        .frame(width: 360, height: 600)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(10)
                        
                        
                        VStack {
                            Image("potatoLookingUp")
                                .resizable()
                                .frame(width: 200, height: 200)
                        }
                    }
                }
            }

#Preview {
    FirstTimeIAView()
}
