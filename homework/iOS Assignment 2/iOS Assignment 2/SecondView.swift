//
//  SecondView.swift
//  iOS Assignment 2
//
//  Created by user285571 on 10/8/25.
//


//
//  SecondView.swift
//  SimpleTwoScreenApp
//
//  Created by Jason Hibbeler on 7/22/25.
//

import SwiftUI

struct SecondView: View {
  @EnvironmentObject var data: Data
  
  var body: some View {
      Spacer()
      TextField("Answer?", text: $static_str)
          .font(.system(size:40))
      Spacer()
  }
}

#Preview {
  SecondView().environmentObject(Data(count: 0))
}
