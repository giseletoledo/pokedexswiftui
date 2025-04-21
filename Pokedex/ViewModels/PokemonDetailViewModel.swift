//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by GISELE TOLEDO on 21/04/25.
//

import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    let pokemon: Pokemon

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    var capitalizedName: String {
        pokemon.capitalizedName
    }

    var formattedId: String {
        "#\(String(format: "%03d", pokemon.id))"
    }

    var imageName: String {
        // Aqui você pode adicionar lógica se quiser fazer fallback para imagem genérica
        UIImage(named: pokemon.imageName) != nil ? pokemon.imageName : "default_pokemon_image"
    }

    var types: [ElementType] {
        pokemon.types
    }
}
