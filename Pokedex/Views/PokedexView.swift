//
//  PokedexView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI


struct PokedexView: View {
    @StateObject private var viewModel = PokedexViewModel()

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Showing \(viewModel.paginatedPokemons.count) of \(viewModel.filteredPokemons.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                    ForEach(viewModel.paginatedPokemons) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCardView(pokemon: pokemon)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }

            if viewModel.totalPages > 1 {
                pageDots
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search Pokémon")
        .onChange(of: viewModel.searchText) {
            viewModel.resetPage()
        }
        .overlay {
            if viewModel.filteredPokemons.isEmpty {
                ContentUnavailableView.search(text: viewModel.searchText)
            }
        }
    }

    private var pageDots: some View {
        HStack(spacing: 8) {
            ForEach(0..<viewModel.totalPages, id: \.self) { index in
                Circle()
                    .fill(index == viewModel.currentPage ? Color.blue : Color.gray.opacity(0.5))
                    .frame(width: 10, height: 10)
                    .onTapGesture {
                        viewModel.selectPage(index)
                    }
            }
        }
        .padding(.bottom, 12)
    }
}

