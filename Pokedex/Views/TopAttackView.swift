//
//  TopAttackView.swift
//  Pokedex
//
//  Created by GISELE TOLEDO on 17/04/25.
//

import SwiftUI

struct TopAttackView: View {
    @StateObject private var viewModel = TopAttackViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top 10 Attack")
                .font(.title.bold())
                .padding(.bottom)

            List(viewModel.topPokemons, id: \.pokemon.id) { entry in
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
