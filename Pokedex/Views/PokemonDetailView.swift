//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Imagem do Pokémon
                if let image = UIImage(named: pokemon.imageName) {
                    // Imagem encontrada nos assets
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                } else {
                    // Imagem genérica caso não seja encontrada
                    Image("default_pokemon_image") // Altere para o nome da imagem genérica
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                }

                // Nome e número
                VStack {
                    Text(pokemon.capitalizedName)
                        .font(.largeTitle.bold())

                    Text("#\(String(format: "%03d", pokemon.id))")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                // Tipos
                HStack(spacing: 16) {
                    ForEach(pokemon.types, id: \.self) { type in
                        TypeIconView(type: type, large: true)
                    }
                }

                // Stats (simplificado)
                StatsView(pokemon: pokemon)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(pokemon.capitalizedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PokemonDetailView(pokemon: pokemons[0])
    }
}

