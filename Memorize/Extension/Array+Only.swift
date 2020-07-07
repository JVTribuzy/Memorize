//
//  Array+Only.swift
//  Memorize
//
//  Created by João Tribuzy on 06/07/20.
//

import Foundation

extension Array {
    var only: Element? { count == 1 ? first : nil }
}
