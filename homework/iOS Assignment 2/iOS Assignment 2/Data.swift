//
//  Data.swift
//  iOS Assignment 2
//
//  Created by user285571 on 10/8/25.
//


//
//  Data.swift
//  SimpleTwoScreenApp
//
//  Created by Jason Hibbeler on 7/22/25.
//

import SwiftUI
import Combine

class Data: ObservableObject {
  @Published var count: Int
  
  init(count: Int) {
    self.count = count
  }
}
