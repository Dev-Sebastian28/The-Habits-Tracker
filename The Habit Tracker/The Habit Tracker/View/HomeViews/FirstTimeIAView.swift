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
                            Text("Welcom to IA habit tracker analyst")
                                .font(Font.title)
                                .fontWeight(Font.Weight.bold)
                                .foregroundStyle(Color(.systemBlue))
                            Text("Here the IA wil analys your goals and habits, then it will cheak your habbits of each goal selected and send you a better version of your habbits.")
                            
                            Text("For a better results:")
                                .font(.title)
                                .foregroundStyle(Color(.brown))
                            
                            Text("1 .create a description for each goal and habbit, so they have a meaning, and make sure they are clear and specific")
                            
                            Text("2. if you have goals that are realative to each other, try to select them all at once, and it will try to analise them")
                            
                            Text("3. The more habbits you have, the better the analysis will be")
                            
                            Text("4. Cheack the end date of your goals and the days of your habbits, and make sure they are correct")
                            
                            Text("IMPORTANT: Sometimes it may take a while to get the analysis, so be patient and don't worry ")
                            
                            Text("IMPORTANT: Sometimes the result may not be 100% accurate, but it will give you a better version of your habbits")
                            
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
