//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Tribuzy on 30/06/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
