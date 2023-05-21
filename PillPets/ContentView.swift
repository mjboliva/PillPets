//
//  ContentView.swift
//  PillPets
//
//  Created by Madison Juliana Oliva on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image1 = Image("chicken")
    var body: some View {
        VStack (spacing: 0.5){
            
            image1
            
            Button(action: {
                
                image1 = Image("chickenHappy")
            }) {
                Image("pillButton")
                    .renderingMode(.original)
                    
            }
            
            
//
//            Image("")
//                .imageScale(.small)
//                .foregroundColor(.accentColor)
//            Text("ew!")
            
//
//            Button("fucker") {
//                image1 = Image("happyChicken")
//            }
//            Image("chickenHappy")
//                .imageScale(.small)
//                .foregroundColor(.accentColor)
//            Text("ew!")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
