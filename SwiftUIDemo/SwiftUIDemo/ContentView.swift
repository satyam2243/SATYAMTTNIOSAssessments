//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Satyam Dixit on 08/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        return NavigationView {
            List {
                Section(header: Text("Adding some Elements to List")){
                    NavigationLink(destination: SwiftUIImage()) {
                        Text("Image")
                    }
                    NavigationLink(destination: SwiftUIText()) {
                        Text("Text")
                    }
                    NavigationLink(destination: SwiftUIVStack()) {
                        Text("VStack")
                    }
                    NavigationLink(destination: SwiftUIHStack()) {
                        Text("HStack")
                    }
                    NavigationLink(destination: SwiftUIPicker()) {
                        Text("Picker")
                    }
                }
            }.navigationBarTitle(Text("SwiftUI Assignment"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                        .previewDisplayName("iPhone 12")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
                        .previewDisplayName("iPhone 13")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                        .previewDisplayName("iPhone 8")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
                        .previewDisplayName("iPhone 8 Plus")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                        .previewDisplayName("iPhone 11")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                        .previewDisplayName("iPhone 11 Pro")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                        .previewDisplayName("iPhone 11 Pro Max")
    }
}
#endif
