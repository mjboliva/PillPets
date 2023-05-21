//
//  FaqCard.swift
//  PillPets
//
//  Created by Prathmesh Jain on 5/20/23.
//

import SwiftUI

struct FaqCard: View {
    var body: some View {
        HStack{
            Text("Some Very Very Very Very Very Very Very Very Very Very Very Very Very Very Very Very Very Very Very Long Fact")
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            Image("Hen")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding()
    }
}

struct FaqCard_Previews: PreviewProvider {
    static var previews: some View {
        FaqCard()
    }
}
