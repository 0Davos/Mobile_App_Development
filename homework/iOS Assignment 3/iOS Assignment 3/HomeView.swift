//
//  FirstView.swift
//  iOS Assignment 3
//
//  Created by user285571 on 10/31/25.
//


//
//  ContentView.swift
//  iOS Assignment #1, UpDown
//
//  Starter code from Jason Hibbeler on 7/21/25.
//  Rest completed by Owen Davis

import SwiftUI



// create navStack surrounding the vstack,
// place the button to settings there,
// then outside the vstack, place a .navigationDestination there

struct HomeView: View {
    @Environment(DataModel.self) private var data: DataModel
    @State private var is_pressed = 0
    //@State private var now_red = false
    
    var body: some View {
        @Bindable var data = data
        NavigationStack {
            VStack {
                Spacer()
                Text("UpDown3").font(.system(size:30))
                Spacer()
                
                if data.isRed {
                    Text(data.getCurrentChar).font(.system(size:90)).foregroundStyle(.red)
                }
                else {
                    Text(data.getCurrentChar).font(.system(size:90))
                }
                
                Spacer()
                HStack {
                    // Up button
                    Button(action : {
                        if data.currentIndex < data.text.count - 1 {
                            data.currentIndex += 1
                            is_pressed = 0
                            data.isRed = false
                        }
                        if is_pressed > 0 {
                            data.isRed = true
                        }
                        if data.currentIndex == data.text.count - 1 && is_pressed == 0 {
                            is_pressed += 1
                        }
                    })
                    {Text("⬆️")}
                    
                    Button(action : {
                        if data.currentIndex > 0 {
                            data.currentIndex -= 1
                            is_pressed = 0
                            data.isRed = false
                        }
                        if is_pressed > 0 {
                            data.isRed = true
                        }
                        if data.currentIndex == 0 && is_pressed == 0 {
                            is_pressed += 1
                        }
                    })
                    {Text("⬇️")}
                }
                Spacer()
                
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                        .font(.system(size:30))
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView().environment(DataModel(text: "ABCDEF"))
}
