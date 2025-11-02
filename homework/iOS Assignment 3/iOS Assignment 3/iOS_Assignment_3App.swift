//
//  iOS_Assignment_3App.swift
//  iOS Assignment 3
//
//  Created by user285571 on 10/31/25.
//

import SwiftUI

@main
struct iOS_Assignment_3App: App {
    @State private var dataModel = DataModel(text: "ABCDEF")
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(dataModel)
        }
    }
}
