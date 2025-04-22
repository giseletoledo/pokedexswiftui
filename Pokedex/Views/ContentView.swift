//
//  ContentView.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI

struct ContentView: View {
    
    private let allPokemons = loadPokemons()
    
    var body: some View {
        TabView {
            NavigationStack {
                PokedexView(pokemons: allPokemons)
                    .navigationTitle("Pokédex")
            }
            .tabItem {
                Label("Pokédex", systemImage: "list.bullet")
            }

            NavigationStack {
                TopAttackView()
            }
            .tabItem {
                Label("Top Ataque", systemImage: "flame")
            }
        }
    }
}
