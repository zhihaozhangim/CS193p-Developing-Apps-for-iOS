//
//  ContentView.swift
//  Memorize
//
//  Created by Zhihao on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        return HStack {
            ForEach(viewModel.cards) { card in
                // All View has the method onTapGesture, it's like onClick callback in React
//                CardView(card: card).onTapGesture {
//                    // When a function takes no args, the empty parenthesis can be omitted.
                     // Since the perform is the last param in the function, the keyword perform can be omitted, and it can be written like the following.
//                    perform: {viewModel.choose(card: card)}
//                }
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .font(Font.largeTitle)
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
