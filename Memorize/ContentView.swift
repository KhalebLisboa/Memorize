//
//  ContentView.swift
//  Memorize
//
//  Created by Khaleb Lisboa on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    var emojisVehicles : Array<String> = ["🛞", "🚜", "🚁", "🚐", "🚀", "🛩️", "🛞", "🚜", "🚁", "🚐", "🚀", "🛩️"]
    var emojisHalloween : Array<String> = ["👻", "🕷️", "🎃", "🐈‍⬛", "🕸️", "👻", "🕷️", "🎃", "🐈‍⬛", "🕸️"]
    var emojisFaces : Array<String> = ["😇", "🫥", "🫡", "🥶", "😶‍🌫️", "😈", "👽", "😇", "🫥", "🫡", "🥶", "😶‍🌫️", "😈", "👽"]
    @State var cardCount : Int = 4
    
    var body: some View {
        Text("Memorize!").font(.largeTitle)
        cards
        Spacer()
        themeChoser
    }
    
    
    
    var cards : some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                
                ForEach(0..<emojisFaces.count, id: \.self){ index in
                    CardView(content : emojisFaces[index])
                    
                }
            }.foregroundColor(.orange)
                .padding()
        }
    }
    
    
    var themeChoser : some View{
        HStack(){
            
            Spacer()
            
            Button( action : { }){
                VStack{
                    Image(systemName: "globe")
                    Text("Tema 1")
                }
            }
            
            Spacer()
            
            Button( action : { }){
                VStack{
                    Image(systemName: "globe")
                    Text("Tema 1")
                }
            }
            
            Spacer()
            
            Button( action : { }){
                VStack{
                    Image(systemName: "globe")
                    Text("Tema 1")
                }
            }
            
            Spacer()
        }.padding(.horizontal)
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
