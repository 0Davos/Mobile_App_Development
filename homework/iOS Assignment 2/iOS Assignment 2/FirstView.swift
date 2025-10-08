//
//  ContentView.swift
//  iOS Assignment #1, UpDown
//
//  Starter code from Jason Hibbeler on 7/21/25.
//  Rest completed by Owen Davis

import SwiftUI

struct FirstView: View {
    @State private var static_str = ["A", "B", "C", "D", "E", "F"]
  @State private var index = 0
  @State private var value = "A"
  @State private var is_pressed = 0
  @State private var now_red = false
  var body: some View {
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
                if index < static_str.count - 1 {
                    index += 1
                    value = String(static_str[index])
                    is_pressed = 0
                    now_red = false
                }
                if is_pressed > 0 {
                    now_red = true
                }
                // If we reach the end of the list, and the button was pressed, we increase is_pressed, next button press will turn the letter red
                if index == static_str.count - 1 && is_pressed == 0 {
                    is_pressed += 1
                }
                
            })
            {Text("⬆️")}
            
            Button(action: {
                if index > 0 {
                    index -= 1
                    value = String(static_str[index])
                    is_pressed = 0
                    now_red = false
                }
                if is_pressed > 0 {
                    now_red = true
                }
                if index == 0 && is_pressed == 0{
                    is_pressed += 1
                }
            })
            {Text("⬇️")}
        }
      
      Spacer()
        if now_red {
            Text("\(value)").font(.system(size:90)).foregroundStyle(.red)
        }
        else {
            Text("\(value)").font(.system(size:90))
        }
        Spacer()
    }
    .padding()
  }
}

#Preview {
  FirstView()
}
