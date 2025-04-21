//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by GISELE TOLEDO on 21/04/25.
//

import Foundation
import SwiftUI

class PokedexViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var currentPage = 0
    
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

    func resetPage() {
        currentPage = 0
    }

    func selectPage(_ index: Int) {
        currentPage = index
    }
}

