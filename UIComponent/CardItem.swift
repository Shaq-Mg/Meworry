//
//  CardItem.swift
//  Meworry
//
//  Created by Shaquille McGregor on 04/05/2024.
//

import SwiftUI

struct CardItem: View {
    @ObservedObject var card: Card
    @Binding var matchedCards: [Card]
    @Binding var userChoices: [Card]
    let cardSize: Int
    
    var body: some View {
        if card.isFaceUp || matchedCards.contains(where: { $0.id == card.id }) {
            Text(card.text)
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(cardSize), height: CGFloat(cardSize))
                .background(.secondary.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
        } else {
            Text("?")
                .font(.system(size: 50).bold())
                .padding()
                .frame(width: CGFloat(cardSize), height: CGFloat(cardSize))
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                .onTapGesture {
                    if userChoices.count == 0 {
                        card.turnOver()
                        userChoices.append(card)
                    } else if userChoices.count == 1 {
                        withAnimation(Animation.linear.delay(1)) {
                            for thisCard in userChoices {
                                thisCard.turnOver()
                            }
                        }
                    }
                }
        }
    }
}

//struct CardItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CardItem()
//    }
//}
