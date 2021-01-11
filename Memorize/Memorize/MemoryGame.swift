//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zhihao on 1/10/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        // \() is like ${} in react, which is used to print an object or struct in a string.
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    // In the View layer, we use ForEach View, the first parameter in the ForEach should be Identifiable.
    // This pattern is called constraint and gains, which limit our behavior, but we will get something valuable from the constraint.
    // For the protocol Identifiable, we gain the ability to be identified, so that the Card can be iterated over in the ForEach. The constraint is that our Card struct now must have a field call id (It can be any type as long as it makes the Card identifiable).
    struct Card: Identifiable {
        // By initialzing the value of isFaceUp and isMatched to be false, we don't need to specify their values in the init.
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
