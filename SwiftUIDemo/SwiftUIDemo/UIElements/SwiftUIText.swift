//
//  SwiftUIText.swift
//  SwiftUIDemo
//
//  Created by satyam dixit on 10/11/21.
//

import SwiftUI

struct SwiftUIText: View {
    var body: some View {
        Text("Sample Text with various attributes, which also auto resizes irrespective of the number of lines.")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.purple)
            .multilineTextAlignment(.center)
            .padding(.all, 20.0)
            .lineLimit(nil)
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
