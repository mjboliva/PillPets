//
//  ContentView.swift
//  PillPets
//
//  Created by Madison Juliana Oliva on 5/20/23.
//

import SwiftUI
import UserNotifications

struct MainView: View {
    //image variables for chicken
    @State private var chicken = Image("neutralChicken")
    @State private var sadChicken = Image("sadChicken")
    @State private var timerDone = false
    @State var count: Int = 0 //for loading animation
    @State var happyCount: Int = 3 //for happy animation
    
    @State var isFaqVisible = false
    
    //creates a timer that updates every second
    let medTimer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var countDown = 10 // for demo purposes we will have the pill being taken every 60 seconds

    
    
    //The actual view
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()

            VStack {
                
//                Button(action: {
//                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success, error in
//                        if success {
//                            print("All good")
//                        }else if let error = error {
//                            print (error.localizedDescription)
//                        }
//                    }
//                }) {
//                    Image("defaultPillButton")
//                }
//
//                Button(action: {
//                    let notif = UNMutableNotificationContent()
//                    notif.title = "Take your medicine!"
//                    notif.subtitle = "Your pet is sad"
//
//                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 11, repeats: false)
//
//                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: notif, trigger: trigger)
//
//                    UNUserNotificationCenter.current().add(request)
//                }) {
//                    Image("defaultPillButton")
//                }
                
                Button(action: {isFaqVisible = true}){
                    Image("faqButton")
                }//.offset(x: -120, y: -80)
        
                
                if (timerDone == true) {
                    
    
                    
                    sadChicken
                    Button(action: {
                        chicken = Image("happyChicken")
                        timerDone = false
                        countDown = 10
                        
                        
                    }) {
                        Image("pillButton")
                            .renderingMode(.original)
                            .frame(width: 50.0, height: 50.0)
                    }
                    .onReceive(medTimer, perform: {_ in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            while (happyCount != 0) {
                                happyCount -= 1
                            }
                            chicken = Image("neutralChicken")
                        }
                    })
                }
                if (countDown > 0) {
                    chicken
                    Text("\(countDown)")
                        .font(.system(size: 60, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.001)
                        .padding()
                    HStack {
                        Image("egg")
                            .frame(width: 5.0, height: 5.0)
                            .offset(x: 55, y: count == 1 ? 80 : 100)
                        Image("crackEgg")
                            .frame(width: 5.0, height: 5.0)
                            .offset(x: 75, y: count == 2 ? 80 : 100)
                        Image("openEgg")
                            .frame(width: 5.0, height: 5.0)
                            .offset(x: 75, y: count == 3 ? 80 : 100)
                            .padding(.all)
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .onAppear {
                            happyCount = 3
                        }
                
                }
            }
                .sheet(isPresented: $isFaqVisible){
                    Faq()
                }
                .onReceive(medTimer, perform: {_ in
                    //updateTimeLeft() //this updates the timer
                    
                    if (countDown > 0 && timerDone == false) {
                        countDown -= 1
                        
                        //this updates the count for the animation
                        withAnimation(.easeInOut(duration: 0.5)) {
                            if (count == 3) {
                                count = 0
                            }else {
                                count += 1
                            }
                        }
                    }else {
                        timerDone = true
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
                
          
