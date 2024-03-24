//
//  ContentView.swift
//  Memorize
//
//  Created by Khaleb Lisboa on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    var emojis : Array<String> = ["👻", "🕷️", "🎃", "🐙"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content : emojis[index])
                
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}



struct CardView : View {
    @State var isFaceUp : Bool = true
    let content : String
    
    var body: some View {
        let base = RoundedRectangle (cornerRadius: 12)
        ZStack{
            
            if isFaceUp {
                base.foregroundColor (.white)
                base.strokeBorder(lineWidth: 2)
                Text (content).font(.largeTitle)
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
