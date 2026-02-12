//
//  addHabitsView.swift
//  The Habit Tracker
//
//  Created by Sebastian Garcia on 6/01/26.
//
import Foundation
import SwiftUI


struct AddHabitsView: View {
    @State var firstAnimation: Bool = false
    @State private var showAddHabit: Bool = false
    @Environment(ViewModel.self) private var vc
    @Environment(navigationFormViewModel.self) private var navigation
    
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(style: .init())
                    .frame(width: 300, height: 200)
                    .shadow(color: .gray, radius: 2, x: 0, y: 4)
                    .overlay(alignment: .top) {
                        Text("wadwadawd")
                            .font(.title2)
                            .bold()
                            .padding(.top, 14)
                    }
                    .overlay(alignment: .leading) {
                        VStack (spacing: 20){
                           HStack {
                               Image(systemName: "circle.dotted")
                                   .padding(.leading, 10)

                               
                               Text("Run 5 km")
                                   .fontWeight(.light)
                                   .frame(width: 100, height: 28)
                                   .underline()
                                   .cornerRadius(9)
                               
                               Spacer()
                               
                               HStack(spacing: 8) {
                                   ForEach(1..<4) { _ in
                                       Circle()
                                           .frame(width: 28, height: 28)
                                           .foregroundStyle(.gray.opacity(0.2))
                                           .overlay(alignment: .center) {
                                               Text("d")
                                           }
                                   }
                               }
                               .padding(.trailing, 16)

                           }
                            Rectangle()
                                .frame(width: 240, height: 0.34)
                                .fontWeight(.thin)
                                
                        }
                        
                    }
                
                    
                HStack (spacing: 40){
                    // Add Habit Button
                    Button {
                        
                    } label: {
                        buttonView(title: "Add Habit", color: .green)
                    }
                    
                    
                    // remove last Habit Button
                    Button {
                        
                    } label: {
                        buttonView(title: "Remove Last", color: .red)
                    }
                }
                .foregroundStyle(.black)
                .padding(.top, -30)
            }
        }
    }
}


private func buttonView(title: String, color: Color) -> some View {
    RoundedRectangle(cornerRadius: 15)
        .fill(color)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
        )
        .frame(width: 140, height: 40)
        .overlay(alignment: .center) {
            Text(title)
                .bold()
        }
}


#Preview {
    AddHabitsView()
        .environment(ViewModel.init())
        .environment(navigationFormViewModel.init())
}

