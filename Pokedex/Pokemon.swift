//
//  Pokemon.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import Foundation

struct Pokemon: Identifiable, Codable {
    var id: Int
    var name: String
    var types: [ElementType]
    var capitalizedName: String {
        name.capitalized
    }
    var imageName: String {
        String(format: "%03d", id)
    }
}
