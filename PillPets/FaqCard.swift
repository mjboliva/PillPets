//
//  FaqCard.swift
//  PillPets
//
//  Created by Prathmesh Jain on 5/20/23.
//

import SwiftUI

struct FaqCard: View {
    
    var body: some View {
        List{
            // 1
            VStack{
                Text("How do I swallow a pill?")
                
                HStack{
                    Image("neutralChicken")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .offset(x: 20, y: 30)
                    
                    ZStack{
                        Image("textBox")
                            .resizable()
                        
                        Text("You can just swallow pills like your food! Just like drinking water after you take a bit of food, you can do the same with your pills! Drink some water to wash down the pill!")
                            .font(.footnote)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .foregroundColor(.black)
                            .frame(maxWidth: 200)
                    }
                    .frame(width: 270.0)
                }
                .padding()
                .frame(height: 200)
                .fixedSize(horizontal: false, vertical: true)
            }
            .listRowSeparator(.hidden)
            
            // 2
            VStack{
                Text("What if I miss a day of taking my medication?")
                
                HStack{
                    Image("neutralChicken")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .offset(x: 20, y: 30)
                    
                    ZStack{
                        Image("textBox")
                            .resizable()
                        
                        Text("No one is perfect, and it’s normal to miss a day of taking medication. If you do, remember to not double up on pills and take your next dose at the next time that you need to. We promise your PillPets will forgive you!")
                            .font(.footnote)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .foregroundColor(.black)
                            .frame(maxWidth: 200)
                    }
                    .frame(width: 270.0)
                }
                .padding()
                .frame(height: 200)
                .fixedSize(horizontal: false, vertical: true)
            }
            .listRowSeparator(.hidden)
            
            // 3
            VStack{
                Text("Why do I need to take medicine when some other people don’t?")
                
                HStack{
                    Image("neutralChicken")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .offset(x: 20, y: 30)
                    
                    ZStack{
                        Image("textBox")
                            .resizable()
                        
                        Text("People take medication for many different reasons. Every person is unique and everyone needs different things to be the happiest they can be in life. Some people need medicine!")
                            .font(.footnote)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .foregroundColor(.black)
                            .frame(maxWidth: 200)
                    }
                    .frame(width: 270.0)
                }
                .padding()
                .frame(height: 200)
                .fixedSize(horizontal: false, vertical: true)
            }
            .listRowSeparator(.hidden)
            
            
            // 4
            VStack{
                Text("Can I share my medicine with others?")
                
                HStack{
                    Image("neutralChicken")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .offset(x: 20, y: 30)
                    
                    ZStack{
                        Image("textBox")
                            .resizable()
                        
                        Text("Your medicine was given to you by your doctor for you only. Only take medicine from your doctor, guardian, or an adult you trust.")
                            .font(.footnote)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .foregroundColor(.black)
                            .frame(maxWidth: 200)
                    }
                    .frame(width: 270.0)
                }
                .padding()
                .frame(height: 200)
                .fixedSize(horizontal: false, vertical: true)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct FaqCard_Previews: PreviewProvider {
    static var previews: some View {
        FaqCard()
    }
}
