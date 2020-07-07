//
//  View+Cardify.swift
//  Memorize
//
//  Created by João Tribuzy on 07/07/20.
//

import SwiftUI

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
