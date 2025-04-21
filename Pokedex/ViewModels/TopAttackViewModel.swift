//
//  TopAttackViewModel.swift
//  Pokedex
//
//  Created by GISELE TOLEDO on 21/04/25.
//

import Foundation
import SwiftUI

class TopAttackViewModel: ObservableObject {
    @Published var topPokemons: [(pokemon: Pokemon, attack: Int)] = []

    init() {
        loadTopAttack()
    }

    func loadTopAttack() {
        // Simula valores de ataque aleatórios, como era na View
        topPokemons = Array(pokemons
            .map { ($0, Int.random(in: 30...100)) }
            .sorted { $0.1 > $1.1 }
            .prefix(10))
    }
}
