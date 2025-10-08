//
//  CustomStepper.swift
//  iOS Assignment 2
//
//  Created by user285571 on 10/8/25.
//


//
//  CustomStepper.swift
//  SimpleTwoScreenApp
//
//  Created by Jason Hibbeler on 7/22/25.
//
//  built-in SwiftUI Stepper is too constrained

import SwiftUI

struct CustomStepper: View {
  var text: String
  var upImageName: String
  var downImageName: String
  var color: Color
  var upAction: () -> Void = {}
  var downAction: () -> Void = {}
  
  var body: some View {
    HStack() {
      Text(text).padding(.trailing, 50).foregroundStyle(color)
      Button(action: upAction) {Image(systemName: upImageName).foregroundStyle(color)}
      Button(action: downAction) {Image(systemName: downImageName).foregroundStyle(color)}
    }
  }
}

#Preview {
  CustomStepper(text: "Test", upImageName: "arrow.up", downImageName: "arrow.down", color: .green)
}
