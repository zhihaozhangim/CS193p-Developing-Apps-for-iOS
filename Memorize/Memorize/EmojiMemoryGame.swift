//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zhihao on 1/10/21.
//

import SwiftUI

// This function will not be used, we will use a arrow function instead. (Arrow function is called closure in Swift)
//func createCardContent(pairIndex: Int) -> String {
//    return "😄"
//}

class EmojiMemoryGame {
    // It's like a glass door: only EmojiMemoryGame can modify its value, but everyone else can access its value.
    // private(set) var model: MemoryGame<String>
    
    // Below is how closure is written in Swift {(argument: type) -> returnType in <functionBody>}
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex: Int) -> String in
//        return "😄"
//    })
    
    // Type can be inferred, so the argument type and return type can be omitted here.
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex) in
//        return "😄"
//    })
    
    // There is only one parameter - pairIndex, the parenthesis can be omitted. Also, the body is one-linear, the return can be omitted.
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { pairIndex in
//        "😄"
//    })
    
    // Again, since closure is the last argument of the function, it can be further streamlined into this.
    // The cardContentFactory key is omitted, the only parameter the function takes is numberOfPairsOfCards.
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in "😄" }
    
    // Once again, since the pairIndex is not used, it can be replaced with a _, which means a parameter that is not used.
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😄" }
    
    // To return emojis other than the smile face, we want to do something more compicated.
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    // Swift is very restrictive in that we cannot use any function until all the instance fields are initialized. Here is a catch-22 here,
    // we want to initialize the model using createMemoryGame function, but we cannot use the function until model is initialized first.
    // To fix this issue, we want to change this function into a static function, which belongs to the class and is already there since compile time.
//    func createMemoryGame() -> MemoryGame<String> {
//        let emojis: Array<String> = ["👻", "🎃"]
//        return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
//            emojis[pairIndex]
//        }
//    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        // Since it's a one-linear, the return can be omitted.
        // return model.cards
        
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
