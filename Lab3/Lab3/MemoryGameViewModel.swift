//
//  MemoryGameViewModel.swift
//  Lab3
//  Created by Pedro Orellana
//  11/3/26
//

import Foundation

@Observable
class MemoryGameViewModel {
    
    nonisolated static let languages = ["c", "kotlin", "swift", "java", "javascript", "python"]
    
    var model: MemoryGameModel = createMemoryGame()
    
    
    //static function to create a new MemoryGameModel instance
    static func createMemoryGame() -> MemoryGameModel {
        return MemoryGameModel(createContent: makeContent, numberOfCardPairs: 6)
    }
    
    //replace this method with getImageName() to make it more efficient
    
//    static func makeContent(_ index: Int) -> String {
//        let languages = ["c", "kotlin", "swift", "java", "javascript", "python"]
//        return languages[index]
//    }
    
    nonisolated static func makeContent(index: Int) -> String {
        return languages[index]
    }
    
    
    //accessor to computed property of model
    var matched_cards: Int {
        model.matched_cards
    }
    
    var cardTotal: Int {
        model.numberOfCardPairs * 2
    }
    
    
    func tapCard(_ card: MemoryGameModel.Card) {
        model.chooseCard(card)
        
    }
    
}
