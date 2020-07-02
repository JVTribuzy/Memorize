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
    
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let choosenIndex: Int = self.index(of: card)
        self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        return 0 // TODO: bogus!
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
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        
        /// Content is a generic type, so you have so tell for the Model what's the type of CardContent
        var content: CardContent
    }
}
