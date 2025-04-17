//
//  TopAttackView.swift
//  Pokedex
//
//  Created by GISELE TOLEDO on 17/04/25.
//

import SwiftUI

struct TopAttackView: View {
    // Simula valores de ataque aleatórios, como na StatsView
    var topPokemons: [(pokemon: Pokemon, attack: Int)] {
        // Ordena e seleciona os 10 primeiros Pokémons
        return Array(pokemons
            .map { ($0, Int.random(in: 30...100)) } // Aleatoriza os ataques
            .sorted { $0.1 > $1.1 } // Ordena por ataque
            .prefix(10)) // Limita a 10 primeiros
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top 10 Attack")
                .font(.title.bold())
                .padding(.bottom)

            List(topPokemons, id: \.pokemon.id) { entry in
                HStack {
                    Image(entry.pokemon.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)

                    VStack(alignment: .leading) {
                        Text(entry.pokemon.capitalizedName)
                            .font(.headline)

                        Text("Attack: \(entry.attack)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
    }
}



#Preview {
    TopAttackView()
}
