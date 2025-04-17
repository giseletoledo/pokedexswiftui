//
//  PokedexView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI


struct PokedexView: View {
    @State private var searchText = ""
    @State private var currentPage = 0

    private let pageSize = 30

    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var totalPages: Int {
        Int(ceil(Double(filteredPokemons.count) / Double(pageSize)))
    }

    var paginatedPokemons: [Pokemon] {
        let start = currentPage * pageSize
        let end = min(start + pageSize, filteredPokemons.count)
        return Array(filteredPokemons[start..<end])
    }

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Showing \(paginatedPokemons.count) of \(filteredPokemons.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                    ForEach(paginatedPokemons) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCardView(pokemon: pokemon)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }

            if totalPages > 1 {
                pageDots
            }
        }
        .searchable(text: $searchText, prompt: "Search Pokémon")
        .onChange(of: searchText) {
            currentPage = 0
        }
        .overlay {
            if filteredPokemons.isEmpty {
                ContentUnavailableView.search(text: searchText)
            }
        }
    }

    private var pageDots: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.blue : Color.gray.opacity(0.5))
                    .frame(width: 10, height: 10)
                    .onTapGesture {
                        currentPage = index
                    }
            }
        }
        .padding(.bottom, 12)
    }
}
