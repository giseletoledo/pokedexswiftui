//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI

struct PokemonCardView: View {
    var pokemon: Pokemon

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
                   // Imagem do Pokémon
                   Image(pokemon.imageName)
                       .resizable()
                       .scaledToFit()
                       .frame(width: 120, height: 120)
                       .clipShape(Circle())
                       .padding(.top)

                   // Nome do Pokémon
                   Text(pokemon.capitalizedName)
                       .font(.headline)
                       .foregroundColor(.primary)

                   // Tipos do Pokémon
                   HStack(spacing: 12) {
                       ForEach(pokemon.types, id: \.self) { type in
                           Text(type.rawValue.capitalized)
                               .font(.footnote)
                               .padding(6)
                               .background(typeColor(for: type))
                               .cornerRadius(12)
                               .foregroundColor(.white)
                       }
                   }
                   .padding(.bottom)

               }
               .padding()
               .background(Color(.systemGray6))
               .cornerRadius(12)
               .shadow(radius: 5)
           }

    // Função para definir a cor do tipo
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

#Preview("Pokémon Card - Bulbasaur", traits: .sizeThatFitsLayout) {
    PokemonCardView(
        pokemon: Pokemon(
            id: 1,
            name: "bulbasaur",
            types: [.grass, .poison]
        )
    )
    .padding()
}
