//
//  ContentView.swift
//  PillPets
//
//  Created by Madison Juliana Oliva on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var backgroundColor = Color.green
    @State private var image1 = Image("chicken")
    var body: some View {
        
        ZStack {
            
            backgroundColor.scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    ColorPicker("", selection: $backgroundColor)
                ).padding(.all)
            
            VStack (spacing: 0.5){
                image1
                Button(action: {
                    image1 = Image("chickenHappy")
                }) {
                    Image("pillButton")
                        .renderingMode(.original)
                        .frame(height: 1.0)
                        .foregroundColor(.accentColor)
                }
                
        
        }
        

           
//            backgroundColor
//                .ignoresSafeArea()
//                .overlay(
//                    ColorPicker("color", selection: $backgroundColor)
//            )
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
        .frame(height: 0.0)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
