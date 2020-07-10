//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Tribuzy on 30/06/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🕷", "🎃", "🕸"]
        return MemoryGame<String>(numberOfPairsOfCard: 3) { pairIndex in
            return emojis[pairIndex]
        }
    }
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{ model.cards }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){ model.choose(card: card) }
    
    func resetGame() { model = EmojiMemoryGame.createMemoryGame() }
}
