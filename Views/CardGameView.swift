//
//  ContentView.swift
//  Meworry
//
//  Created by Shaquille McGregor on 04/05/2024.
//

import SwiftUI

struct CardGameView: View {
    @State var cards = createCardList().shuffled()
    @State var matchedCards = [Card]()
    @State var userChoices = [Card]()
    
    private var fourColumns =
    [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    private var sixColumns =
    [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),
     GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Meworry Card Game 🃏")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourColumns, spacing: 10) {
                    ForEach(cards) { card in
                        CardItem(card: card, matchedCards: $matchedCards, userChoices: $userChoices, cardSize: Int(geo.size.width/4 - 10))
                    }
                }
                VStack {
                    Text("Match these cards to win:")
                    
                    LazyVGrid(columns: sixColumns, spacing: 5) {
                        ForEach(cardValues, id: \.self) { cardValue in
                            if !matchedCards.contains(where: { $0.text == cardValue }) {
                                Text(cardValue)
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}
