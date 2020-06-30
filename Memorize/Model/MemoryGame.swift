//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Tribuzy on 30/06/20.
//

import Foundation

/// Tell what the specifc type of 'CardContent' generic
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card choosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1,content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        
        /// Content is a generic type, so you have so tell for the Model what's the type of CardContent
        var content: CardContent
    }
}
