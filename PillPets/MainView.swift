//
//  ContentView.swift
//  PillPets
//
//  Created by Madison Juliana Oliva on 5/20/23.
//

import SwiftUI

struct MainView: View {
    //image variables for chicken
    @State private var chicken = Image("neutralChicken")
    @State private var timerDone = false
    
    //publishes dates
    let medTimer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: RunLoop.Mode.common).autoconnect()

    //countdown
    @State var timeLeft: String = ""
    @State var count: Int = 0

    let nextPillDate: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()


    //function for updating time
    func updateTimeLeft() {

        //this updates the time
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: nextPillDate)
        let hoursLeft = remaining.hour ?? 0
        let minLeft = remaining.minute ?? 0
        let secLeft = remaining.second ?? 0

        //this updates the display time string
        if (hoursLeft > 1) {
            timeLeft = "\(hoursLeft) hours, \(minLeft) minutes, and \(secLeft) seconds left"
        }else {
            if (minLeft > 1) {
                timeLeft = "\(minLeft) minutes, and \(secLeft) seconds left"
            }else {
                timeLeft = "\(secLeft) seconds left"
            }
        }
        

    }
    
    
    //The actual view
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.blue, Color.green]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()

            VStack {
                
                chicken
                    Button(action: {
                        chicken = Image("happyChicken")
                    }) {
                        Image("pillButton")
                            .renderingMode(.original)
                            .frame(width: 20.0, height: 10.0)
                            .foregroundColor(.accentColor)
                    }
                Text(timeLeft)
                    .font(.system(size: 150, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.001)
                    .padding()
                HStack {
                    Image("egg")
                        .frame(width: 5.0, height: 5.0)
                        .offset(x: 55, y: count == 1 ? 180 : 200)
                    Image("crackEgg")
                        .frame(width: 5.0, height: 5.0)
                        .offset(x: 75, y: count == 2 ? 180 : 200)
                    Image("openEgg")
                        .frame(width: 5.0, height: 5.0)
                        .offset(x: 75, y: count == 3 ? 180 : 200)
                        .padding(.all)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                .onReceive(medTimer, perform: {_ in
                    updateTimeLeft() //this updates the timer
                
                    //this updates the count for the animation
                    withAnimation(.easeInOut(duration: 0.5)) {
                        if (count == 3) {
                            count = 0
                        }else {
                            count += 1
                        }
                    }
                })
            }
        }
        struct MainView_Previews: PreviewProvider {
            static var previews: some View {
                MainView()
            }
        }
    }
                
          
            
//            VStack (spacing: 0.5){
//                chicken
//                Button(action: {
//                    chicken = Image("chickenHappy")
//                }) {
//                    Image("pillButton")
//                        .renderingMode(.original)
//                        .frame(height: 1.0)
//                        .foregroundColor(.accentColor)
//                }
//            }
//
//
//            struct MainView_Previews: PreviewProvider {
//                static var previews: some View {
//                    MainView()
//                }
//            }
//        }
//
//
//
//
        
        //
        //            VStack (spacing: 0.5){
        //                chicken
        //                Button(action: {
        //                    chicken = Image("chickenHappy")
        //                }) {
        //                    Image("pillButton")
        //                        .renderingMode(.original)
        //                        .frame(height: 1.0)
        //                        .foregroundColor(.accentColor)
        //                }
        //
        //
        //
        
        
        //ZStack {
        //
        //            backgroundColor.scaledToFill()
        //                .ignoresSafeArea()
        //                .overlay(
        //                    ColorPicker("", selection: $backgroundColor)
        //                ).padding(.all)
        //
        //            VStack (spacing: 0.5){
        //                image1
        //                Button(action: {
        //                    image1 = Image("chickenHappy")
        //                }) {
        //                    Image("pillButton")
        //                        .renderingMode(.original)
        //                        .frame(height: 1.0)
        //                        .foregroundColor(.accentColor)
        //                }
        //
        //
        //        }
        
        //struct Previews_MainView_Previews: PreviewProvider {
        //    static var previews: some View {
        //        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        //    }
        //}
//    }

