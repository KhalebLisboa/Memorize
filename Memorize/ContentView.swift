//
//  ContentView.swift
//  Memorize
//
//  Created by Khaleb Lisboa on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    let emojisVehicles : Array<String> = ["🛞", "🚜", "🚁", "🚐", "🚀", "🛩️", "🛞", "🚜", "🚁", "🚐", "🚀", "🛩️"]
    let emojisHalloween : Array<String> = ["👻", "🕷️", "🎃", "🐈‍⬛", "🕸️", "👻", "🕷️", "🎃", "🐈‍⬛", "🕸️"]
    let emojisFaces : Array<String> = ["😇", "🫥", "🫡", "🥶", "😶‍🌫️", "😈", "👽", "😇", "🫥", "🫡", "🥶", "😶‍🌫️", "😈", "👽"]
    
    @State var emojis : Array<String> = []
    @State var cardCount : Int = 4
    
    var body: some View {
        Text("Memorize!").font(.largeTitle)
        if !emojis.isEmpty {
            cards
        } else {
            emptyListMessage
        }
        themeSelectorMenu
    }
    
    
    
    var cards : some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
                ForEach(0..<emojis.count, id: \.self){ index in
                    CardView(content : emojis[index])
                }
            }
            .foregroundColor(.orange)
            .padding()
        }
    }
    
    var emptyListMessage : some View {
        VStack{
            Spacer()
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Image(systemName: "tray.fill").imageScale(.large).font(.title)
                Text("Select a theme below")
            })
            Spacer()
        }
    }
    
    
    var themeSelectorMenu : some View{
        HStack(){
            Spacer()
            themeSelector(content: "Halloween", icon: "🎃", collection: emojisHalloween)
            Spacer()
            themeSelector(content: "Vehicles", icon: "🛞", collection: emojisVehicles)
            Spacer()
            themeSelector(content: "Faces", icon: "😇", collection: emojisFaces)
            Spacer()
        }.padding(.horizontal)
    }
    
    
    func themeSelector(content : String, icon : String, collection : Array<String>) -> some View{
        Button( action : { 
            emojis = collection.shuffled()
        }){
            VStack{
                Text(icon).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(content)
            }.foregroundColor(.black)
        }
    }
}






struct CardView : View {
    @State var isFaceUp : Bool = false
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
