//
//  FormView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 1/01/26.
//

import SwiftUI
// Primera Vista
struct WelcomeFirstView: View {
    @Environment(ViewController.self) private var vc
    @Environment(navigationFormViewModel.self) private var navigation
    var body: some View {
        VStack {
            VStack  {
                Text("Welcome to The Habit Tracker!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Let's get you started! Please fill out the form. We'll guide you through the process.")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                
                Image("potato")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                Button {
                    navigation.goToAccountFormView()
                    
                } label: {
                    Text("Get Started!")
                        .font(.largeTitle)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                }
                
                HStack {
                    Text("Let's achive your goals!")
                    
                    
                }
                Text("IA integrated")
                    .font(.callout)
                    .foregroundStyle(.pink)
                
                VStack{
                    Text("Coaching integrated")
                        .font(.callout)
                        .foregroundStyle(.blue)
                }
                Spacer()
                
            }
        }
    }
}



#Preview {
    WelcomeFirstView()
        .environment(ViewController.init())
        .environment(navigationFormViewModel.init())
}

