//
//  Data.swift
//  SimpleTwoScreenApp_Observation
//
//  Created by Jason Hibbeler on 10/11/25.
//

import SwiftUI

@Observable class DataModel {
    var text: String
    var currentIndex: Int
    var isRed: Bool
    
    init(text: String = "ABCDEF", currentIndex: Int = 0, isRed: Bool = false) {
        self.text = text
        self.currentIndex = currentIndex
        self.isRed = isRed
    }
    
    var getCurrentChar: String {
        guard !text.isEmpty && currentIndex < text.count else {return ""}
        let index = text.index(text.startIndex, offsetBy: currentIndex)
        return String(text[index])
    }
}
