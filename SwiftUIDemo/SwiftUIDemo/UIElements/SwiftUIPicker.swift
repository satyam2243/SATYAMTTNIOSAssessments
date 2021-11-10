//
//  SwiftUIPicker.swift
//  SwiftUIDemo
//
//  Created by satyam dixit on 10/11/21.
//

import SwiftUI

struct SwiftUIPicker: View {
    
    @State private var pickerSelectedIndex: Int = 0
    var arrayText = ["Picker Data One","Picker Data Two","Picker Data Three"]
    
    var body: some View {
        VStack(spacing: 20.0) {
            Picker(selection:$pickerSelectedIndex, label: Text("Picker")) {
                ForEach(0..<arrayText.count) {
                    Text(self.arrayText[$0])
                        .multilineTextAlignment(.center)
                        .frame(width: 500)
                        .padding(.all, 10.0) //.tag($0)
                }
                }.frame(width: UIScreen.main.bounds.width/2)
            
            Text("Selected value is:  \(self.arrayText[pickerSelectedIndex])")
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
        }
        .padding(.all, 20.0)
    }
    
}

struct SwiftUIPicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPicker()
    }
}
