//
//  AccountFormView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 9/01/26.
//

import SwiftUI

struct AccountFormSecondView: View {
    @State private var animateImage: Bool = false
    @Environment(navigationFormViewModel.self) private var navigation
    @Environment(ViewController.self) private var vc
    @State private var username: String = ""
    @State private var userAge: String = ""
    @State private var userOccupation: String = ""
    @State private var userLocation: String = ""
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        ZStack {
            VStack{
                if animateImage {
                    Image("potatoLookingDown")
                        .transition(.move(edge: .top))
                    Spacer()
                } else{
                    
                }
            }
            VStack {
                Spacer()
                VStack(spacing:15){
                    
                    BlueprintTextField(
                        data: username ,
                        prompt: Text("   Essential"),
                        question: "What is your name?"
                    )
                    
                    BlueprintTextField(
                        data: userAge ,
                        prompt: Text("   Optional"),
                        question: "How old are you?"
                    )
                    
                    BlueprintTextField(
                        data: userOccupation ,
                        prompt: Text("   Essential"),
                        question: "Whats your job or occupation?"
                    )
                    
                    BlueprintTextField(
                        data: userLocation ,
                        prompt: Text("   Essential"),
                        question: "Where are you from?"
                    )
                    
                    BlueprintTextField(
                        data: userEmail ,
                        prompt: Text("   Essential"),
                        question: "What's your Email?"
                    )
                    
                    BlueprintTextField(
                        data: userPassword ,
                        prompt: Text("   Essential"),
                        question: "Create a password"
                    )
                    
                    
                }
                .frame(width: 390, height: 550)
                .background(Color.green.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(radius: 10)
                
                .padding(.vertical, 10)
                Button {
                    // Start Form
                    vc.userDataInput(name: username, email: userEmail, password: userPassword, userAge: userAge, userCountry: userLocation, userOccupation: userOccupation, isPremium: false, userImage: "")
                    navigation.goToGoalFormView()
                    
                } label: {
                    Text("Next")
                        .font(.largeTitle)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                }
            }
        }.task {
            try? await Task.sleep(for: .seconds(1) )
            animateImage.toggle()
        }
        .animation(.easeInOut.delay(0.5), value: animateImage)
    }
}

private struct BlueprintTextField: View {
    @State var data: String
    var prompt: Text?
    var question: String
    var body: some View {
        VStack(spacing:3){
            HStack {
                Text(question)
                    .font(Font.system(size: 18, weight:.black, design: .default))
                    .padding(.leading, 55)
                Spacer()
            }
            TextField("", text: $data, prompt: prompt, axis: .vertical)
                .frame(width: 300,height: 40)
                .background(.white)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    AccountFormSecondView()
        .environment(ViewController.init())
        .environment(navigationFormViewModel.init())
}
