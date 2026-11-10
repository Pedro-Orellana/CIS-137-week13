//
//  CardView.swift
//  Lab3
//  Created by Pedro Orellana
//  11/3/26
//

import SwiftUI

struct CardView: View {
    
    var card: MemoryGameModel.Card
    
    var body: some View {
        
        ZStack {
            
            if(!card.isFaceUp) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                    .frame(width: 120, height: 150)
                    .opacity(1)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .frame(width: 120, height: 150)
                        .opacity(card.isMatched ? 0.3 : 0)
                    
                    VStack {
                        Image(card.content)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text(card.content.capitalized)
                            .font(.headline)
                    }
                }
              
            }
            
            //border of the card
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .frame(width: 120, height: 150)

          
        }
        .rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180), axis: (x: 0, y: 1, z: 0))
        .animation(.easeInOut, value: card.isFaceUp)
        .animation(.easeInOut, value: card.isMatched)
        
    }
}

#Preview {
    
    let card: MemoryGameModel.Card = MemoryGameModel.Card(content: "kotlin", id: 1)
    
    CardView(card: card)
}

