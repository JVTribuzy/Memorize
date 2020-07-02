//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Tribuzy on 30/06/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static var emojis: Array<String> {
        var emojiList: Array<String> = []
        for i in 0x1F601...0x1F64F { emojiList.append(String(UnicodeScalar(i) ?? "-")) }
        return emojiList
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
            return emojis[pairIndex]
        }
    }
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{ model.cards }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
