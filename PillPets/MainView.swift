//
//  ContentView.swift
//  PillPets
//
//  Created by Madison Juliana Oliva on 5/20/23.
//

import SwiftUI

struct MainView: View {
    //publishes dates
    let medTimer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: RunLoop.Mode.common).autoconnect()
    
    //countdown
    @State var timeLeft: String = ""
    @State var count: Int = 0
    let nextPillDate: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
    
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
    
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.blue, Color.green]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            VStack {
                Text(timeLeft)
                    .font(.system(size: 150, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .minimumScaleFactor(0.1)
                    .padding()

                HStack {
                    Image("mjChick")
                        .frame(width: 5.0, height: 5.0)
                        .offset(x: -100, y: count == 1 ? 180 : 200)
                    Image("mjChick")
                        .frame(width: 10.0, height: 10.0)
                        .offset(y: count == 2 ? 180 : 200)
                    Image("mjChick")
                        .offset(x: 100, y: count == 3 ? 180 : 200)
                        .frame(width: 5.0, height: 5.0)
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .onReceive(medTimer, perform: {_ in
                //this updates the timer
                updateTimeLeft();
                
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
