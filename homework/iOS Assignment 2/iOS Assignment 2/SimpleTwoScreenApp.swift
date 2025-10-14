//
//  SimpleTwoScreenApp_ObservationApp.swift
//  SimpleTwoScreenApp_Observation
//
//  Created by Jason Hibbeler on 10/11/25.
//

// this shows how to use the new "Observation" framework, which is required for iOS 26+

import SwiftUI

@main
struct SimpleTwoScreenApp_ObservationApp: App {
    @State private var data = DataModel(text: "ABCDEF")
  var body: some Scene {
      WindowGroup {
        HomeView().environment(data)
      }
  }
}
