//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Tribuzy on 30/06/20.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😀" }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{ model.cards }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
