//
//  ContentView.swift
//  iOS Assignment #1, UpDown
//
//  Starter code from Jason Hibbeler on 7/21/25.
//  Rest completed by Owen Davis

import SwiftUI

struct FirstView: View {
  @Environment(DataModel.self) private var data: DataModel
  //@State private var static_str = ["A", "B", "C", "D", "E", "F"]
  //@State private var index = 0
  //@State private var value = "A"
  @State private var is_pressed = 0
  @State private var now_red = false
    
    
  var body: some View {
    @Bindable var data = data
      
    VStack {
      Spacer()
        Text("UpDown").font(.system(size:30))
      Spacer()
        HStack {
            // Up button
            Button(action: {
                // Basic check to stay in bounds
                // Increase index, value gets replaced, is_pressed reset to 0
                // is_pressed only for top and bottom bounds
                if data.currentIndex < data.text.count - 1 {
                    data.currentIndex += 1
                    is_pressed = 0
                    now_red = false
                }
                if is_pressed > 0 {
                    now_red = true
                }
                // If we reach the end of the list, and the button was pressed, we increase is_pressed, next button press will turn the letter red
                if data.currentIndex == data.text.count - 1 && is_pressed == 0 {
                    is_pressed += 1
                }
                
            })
            {Text("⬆️")}
            
            Button(action: {
                if data.currentIndex > 0 {
                    data.currentIndex -= 1
                    is_pressed = 0
                    now_red = false
                }
                if is_pressed > 0 {
                    now_red = true
                }
                if data.currentIndex == 0 && is_pressed == 0{
                    is_pressed += 1
                }
            })
            {Text("⬇️")}
        }
      
      Spacer()
        if now_red {
            Text(data.getCurrentChar).font(.system(size:90)).foregroundStyle(.red)
        }
        else {
            Text(data.getCurrentChar).font(.system(size:90))
        }
        Spacer()
    }
    .padding()
  }
}

#Preview {
  FirstView()
}
