//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI

struct PokemonDetailView: View {
    @StateObject private var pokemonDetailViewModel: PokemonDetailViewModel
    
    init(pokemon: Pokemon) {
        _pokemonDetailViewModel =  StateObject(wrappedValue: PokemonDetailViewModel(pokemon: pokemon))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Imagem do Pokémon
                if let image = UIImage(named: pokemonDetailViewModel.imageName) {
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
                    Text(pokemonDetailViewModel.capitalizedName)
                        .font(.largeTitle.bold())

                    Text(pokemonDetailViewModel.formattedId)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                // Tipos
                HStack(spacing: 16) {
                    ForEach(pokemonDetailViewModel.types, id: \.self) { type in
                        TypeIconView(type: type, large: true)
                    }
                }

                // Stats (simplificado)
                StatsView(pokemon: pokemonDetailViewModel.pokemon)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(pokemonDetailViewModel.capitalizedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PokemonDetailView(pokemon: pokemons[0])
    }
}

