//
//  SwiftUIImage.swift
//  SwiftUIDemo
//
//  Created by satyam dixit on 10/11/21.
//

import SwiftUI

struct SwiftUIImage: View {
    var body: some View {
        VStack{
            Text("Hello! I am CutePanda")
                .font(.title)
                .padding(.all, 50)
                .background(Color.blue)
            Image("CutiePanda")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250.0, height: 250.0, alignment: .center)
            .clipShape(Circle())
            .padding(.top, 100.0)
            Spacer()
            
        }.background(Color.orange)
    }
}

struct SwiftUIImage_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImage()
    }
}


/**
 
 {
     
         @State private var showAlert = false
         @State private var pickerSelectedIndex: Int = 0
         var arrayText = ["Picker Data One","Picker Data Two","Picker Data Three"]
     
     
     var body: some View {
         return NavigationView {
             List {
                 //Im
                 Section(header: Text("Image Demo")) {
                    Image("CutiePanda")
                         .resizable()
                         .cornerRadius(50)
                         .aspectRatio(contentMode: .fill)
                         
                 }
                 
                 Section(header: Text("Text Demo")){
                     Text("Text is here, HELLO !!")
                 }
                 
                 Section(header: Text("Vertical Stack View Demo")){
                     VStack {
                         Text("Instant Developer")
                             .fontWeight(.medium)
                             .foregroundColor(.green)
                             .padding()
                             .frame(width: 200, height: 100, alignment: .center)
                         Image(systemName: "heart.fill")
                             .resizable()
                             .aspectRatio(contentMode: .fill)
                             .padding()
                             .foregroundColor(.blue)
                             
                             
                     }
                     .border(.blue, width: 5.0)
                 }
                 
                 Section(header: Text("Horizontal Stack View Demo")){
                     HStack{
                         Text("Instant Developer")
                             .fontWeight(.medium)
                             .foregroundColor(.green)
                             .padding()
             
                         Image(systemName: "heart.fill")
                             .resizable()
                             .aspectRatio(contentMode: .fill)
                             .padding()
                             .foregroundColor(.blue)
                             
                     }
                     .border(.green, width: 5.0)
                 }
                 
                 Section(header: Text("Button Demo")){
                     Button(action: {
                         print("Button Tapped")
                     }, label: {
                         Text("SwiftUIDemoButton")
                     })
                         .padding(.all, 20.0)
                         .frame(width: 255.0, height: 50, alignment: .center)
                         .background(Color.green)
                         .border(.blue, width: 1.0)
                         .cornerRadius(20)
                         .foregroundColor(.white)
                         
                 }
                 
                 Section(header: Text("Picker Demo")){
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
                             .foregroundColor(.blue)
                             .multilineTextAlignment(.center)
                     }
                     .padding(.all, 10.0)
                 }
                 
             }.navigationBarTitle(Text("Welcome To Swift UI"))
         }
     }

 **/
