//
//  SecondView.swift
//  SimpleTwoScreenApp_Observation
//
//  Created by Jason Hibbeler on 10/11/25.
//

import SwiftUI

struct SecondView: View {
  @Environment(DataModel.self) private var data: DataModel
  
  var body: some View {
    @Bindable var data = data
      
    ZStack() {
      VStack() {
        Spacer()
          TextField("Enter text here", text: $data.text)
              .font(.system(size:50))
              .padding(100)
              //.padding(.horizontal)
          Spacer()
      }
    }
  }
}

#Preview {
    SecondView().environment(DataModel(text: "ABCDEF"))
}
