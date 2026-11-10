//
//  ContentView.swift
//  Lab3
//  Created by Pedro Orellana
//  11/3/26
//

import SwiftUI

struct ContentView: View {
    
    //create a viewModel instance
    @State private var viewModel = MemoryGameViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
    var body: some View {
        Text("Programming languages")
            .font(.title)
        
        ProgressView("Game Completion", value: Double(viewModel.matched_cards), total: Double(viewModel.cardTotal))
            .padding()
        
        LazyVGrid(columns: columns) {
            
            ForEach(viewModel.model.cards) { card in
                
                CardView(card: card)
                    .onTapGesture {
                        withAnimation {
                            viewModel.tapCard(card)
                        }
                        
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
