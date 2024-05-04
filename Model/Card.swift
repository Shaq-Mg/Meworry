//
//  Card.swift
//  Meworry
//
//  Created by Shaquille McGregor on 04/05/2024.
//

import Foundation
import SwiftUI

class Card: Identifiable, ObservableObject {
    var id = UUID()
    var text: String
    @Published var isFaceUp = false
    @Published var isMatched = false
    
    init(text: String) {
        self.text = text
    }
    func turnOver() {
        self.isFaceUp.toggle()
    }
}

let cardValues = [
"🍉", "🥭", "🍏", "🍎", "🍇", "🥝", "🍋", "🍒", "🍍", "🍓", "🍊", "🥥",
]

func createCardList() -> [Card] {
    //create a blank list
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

let faceDownCard = Card(text: "?")
