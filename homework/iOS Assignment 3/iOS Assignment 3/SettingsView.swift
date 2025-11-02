//
//  SecondView.swift
//  iOS Assignment 3
//
//  Created by user285571 on 10/31/25.
//


//
//  SecondView.swift
//  SimpleTwoScreenApp_Observation
//
//  Created by Jason Hibbeler on 10/11/25.
//

import SwiftUI

struct SettingsView: View {
  @Environment(DataModel.self) private var data: DataModel
  @State private var navigateHome = false
  @State private var temp_text = ""
  
    var body: some View {
        @Bindable var data = data
        
        
        VStack() {
            Spacer()
            TextField("", text: $temp_text)
                .textFieldStyle(.roundedBorder)
                .font(.system(size:60))
                .multilineTextAlignment(.center)
                .frame(width: 375)
                .overlay(
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 3)
                )
            
            Text("Text to display")
            Spacer()
            if !temp_text.isEmpty{
                Text(" ")
                    .font(.system(size:30))
            }
            if temp_text.isEmpty {
                Text("Text cannot be empty")
                    .font(.system(size:30))
                    .foregroundStyle(.red)
            }
            
            
            Spacer()
            Button(action: {
                if !temp_text.isEmpty {
                    data.text = temp_text
                }
                
                if data.currentIndex > data.text.count - 1 {
                    data.currentIndex = data.text.count - 1
                }
                
                navigateHome = true
            }) {
                Text("Save")
                    //.font(.system(size: 30))
            }
            .disabled(temp_text.isEmpty)
            
            
            Button(action: {
                data.isRed = false
                navigateHome = true
            }) {
                Text("Cancel")
            }
            NavigationLink(destination: HomeView(), isActive: $navigateHome) {
                EmptyView()
            }
            .hidden()
            
            Spacer()
        }
        .navigationTitle("Settings")
        .onAppear{temp_text = data.text}
      
    }
  }


#Preview {
    SettingsView().environment(DataModel(text: "ABCDEF"))
}
