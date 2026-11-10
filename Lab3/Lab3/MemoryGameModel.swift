//
//  MemoryGameModel.swift
//  Lab3
//  Created by Pedro Orellana
//  11/3/26
//

import Foundation


struct MemoryGameModel {
    
    //create a property that holds an array of cards
    private(set) var cards: [Card]
    private(set) var numberOfCardPairs: Int
    
    //create properties to hold selected cards
    private(set) var firstSelectedCardIndex : Int? = nil
    private(set) var secondSelectedCardIndex : Int? = nil
    
    //computed property for progress
    var matched_cards: Int {
        var counter = 0
        cards.forEach{ card in
            if(card.isMatched) {
                counter+=1
            }
        }
        
        return counter
    }
    
    struct Card: Identifiable {
        let content: String
        var isFaceUp = false
        var isMatched = false
        let id: Int
        
    }
    
    //create function to select a card
    mutating func chooseCard(_ card: Card) {
        for index in cards.indices {
            
            if(cards[index].id == card.id && !cards[index].isMatched && !cards[index].isFaceUp) {
                cards[index].isFaceUp = true
                
                if(firstSelectedCardIndex == nil) {
                    firstSelectedCardIndex = index
                } else if (secondSelectedCardIndex == nil && cards[self.firstSelectedCardIndex!].id != card.id) {
                    
                    secondSelectedCardIndex = index
                    
                    if(cards[self.firstSelectedCardIndex!].content == cards[self.secondSelectedCardIndex!].content) {
                        //there is a match, match the cards
                        cards[self.firstSelectedCardIndex!].isMatched = true
                        cards[self.secondSelectedCardIndex!].isMatched = true
                        firstSelectedCardIndex = nil
                        secondSelectedCardIndex = nil
                    }
                    
                } else if (firstSelectedCardIndex != nil && secondSelectedCardIndex != nil) {
                    //A third card is selected, flip the previous 2 cards
                    cards[self.firstSelectedCardIndex!].isFaceUp = false
                    cards[self.secondSelectedCardIndex!].isFaceUp = false
                    
                    //assign the new card index to the firstSelectedCardId
                    firstSelectedCardIndex = index
                    secondSelectedCardIndex = nil
                }
            }
        }
    }
    
    
    
    //init function, which is essentially a constructor
    init(createContent: (Int) -> String, numberOfCardPairs: Int) {

        var cards : [Card] = []
        
        for i in 0..<numberOfCardPairs {
            //for each number of pair, create 2 cards with the same content, with different id
            let cardContent = createContent(i)
            
            let card1 = Card(content: cardContent, id: (i * 2))
            let card2 = Card(content: cardContent, id: ((i * 2) + 1))
            
            //add cards to the array
            cards += [card1, card2]
      
        }
        
        //shuffle cards to make sure they are in random order
        cards.shuffle()
        
        self.cards = cards
        self.numberOfCardPairs = numberOfCardPairs
        
    }
    
    
}
