//
//  StatsView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI

struct StatsView: View {
    
    let pokemon: Pokemon
    @StateObject private var viewModel: StatsViewModel
    
    init(pokemon: Pokemon) {
            self.pokemon = pokemon
            _viewModel = StateObject(wrappedValue: StatsViewModel(pokemon: pokemon))
        }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Stats")
                .font(.title2.bold())
            
            ForEach(viewModel.stats) { stat in
                HStack {
                    Text(stat.name)
                        .frame(width: 80, alignment: .leading)
                    
                    ProgressView(value: Float(stat.value), total: 100)
                        .tint(typeColor(for: pokemon.types.first ?? .normal))
                    
                    Text("\(stat.value)")
                        .frame(width: 30, alignment: .trailing)
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
    
    // Função que define as cores para os tipos de Pokémon
       func typeColor(for type: ElementType) -> Color {
           switch type {
           case .grass: return Color.green
           case .poison: return Color.purple
           case .fire: return Color.orange
           case .flying: return Color.blue.opacity(0.5)
           case .water: return Color.blue
           case .bug: return Color.green.opacity(0.7)
           case .normal: return Color.gray
           case .electric: return Color.yellow
           case .ground: return Color.brown
           case .fairy: return Color.pink
           case .psychic: return Color.pink.opacity(0.7)
           case .rock: return Color.gray.opacity(0.7)
           case .ice: return Color.cyan
           case .dragon: return Color.indigo
           case .dark: return Color.black
           case .steel: return Color.gray.opacity(0.5)
           case .fighting: return Color.red
           case .ghost: return Color.purple.opacity(0.5)
           }
       }
}


