//
//  StatsViewModel.swift
//  Pokedex
//
//  Created by GISELE TOLEDO on 21/04/25.
//

import Foundation
import SwiftUI

class StatsViewModel: ObservableObject {
    @Published var stats: [Stat] = []

    init(pokemon: Pokemon) {
        generateStats(for: pokemon)
    }

    // Valores fictícios para demonstração
    private func generateStats(for pokemon: Pokemon) {
        stats = [
            Stat(name: "HP", value: Int.random(in: 30...100)),
            Stat(name: "Attack", value: Int.random(in: 30...100)),
            Stat(name: "Defense", value: Int.random(in: 30...100)),
            Stat(name: "Sp. Atk", value: Int.random(in: 30...100)),
            Stat(name: "Sp. Def", value: Int.random(in: 30...100)),
            Stat(name: "Speed", value: Int.random(in: 30...100))
        ]
    }
}
