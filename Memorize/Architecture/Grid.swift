//
//  Grid.swift
//  Memorize
//
//  Created by João Tribuzy on 06/07/20.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        ForEach(items) { item in
            self.viewForItem(item)
        }
    }
}
