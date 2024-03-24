//
//  ContentView.swift
//  Memorize
//
//  Created by Khaleb Lisboa on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    var emojis : Array<String> = ["👻", "🕷️", "🎃", "🐙", "👻", "🕷️", "🎃", "🐙"]
    @State var cardCount : Int = 4
    
    var body: some View {
        cards
        Spacer()
        cardCountAdjusters
    }
    
    
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content : emojis[index])
                
            }
        }.foregroundColor(.orange)
            .padding()
    }
    
    
    var cardRemover : some View {
        cardCountAdjuster(by: -1, argument: "minus.square.fill")
    }
    
    
    var cardAdder : some View {
        cardCountAdjuster(by: +1, argument: "plus.square.fill")
    }
    
    
    var cardCountAdjusters : some View {
        HStack{
            cardCountAdjuster(by: -1, argument: "minus.square.fill")
            Spacer()
            cardCountAdjuster(by: +1, argument: "plus.square.fill")
        }.imageScale(.large).padding()
    }
    
    
    func cardCountAdjuster(by offset : Int, argument : String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image( systemName: argument)
        }).disabled(cardCount + offset > emojis.count || cardCount + offset == 0)
            .font(.largeTitle)
    }
}






struct CardView : View {
    @State var isFaceUp : Bool = true
    let content : String
    
    var body: some View {
        let base = RoundedRectangle (cornerRadius: 12)
        ZStack{
            base.foregroundColor (.white)
            base.strokeBorder(lineWidth: 2)
            Text (content).font(.largeTitle)
            base.opacity(isFaceUp ? 0 : 1)
    
        }.onTapGesture {
            isFaceUp.toggle()
        }.aspectRatio(contentMode: .fill)
    }
}

#Preview {
    ContentView()
}
