//
//  ContentView.swift
//  Memorize
//
//  Created by Khaleb Lisboa on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp : true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView : View {
    @State var isFaceUp : Bool = false
    
    var body: some View {
        let base = RoundedRectangle (cornerRadius: 12)
        ZStack{
            
            if isFaceUp {
                base.foregroundColor (.white)
                base.strokeBorder(lineWidth: 2)
                Text ("👻").font(.largeTitle)
            }
            else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
