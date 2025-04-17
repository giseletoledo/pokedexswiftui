//
//  TypeIconHelper.swift
//  Pokedex
//
//  Created by Aluno Mack on 16/04/25.
//

import SwiftUI

struct TypeIconView: View {
    let type: ElementType
    var large: Bool = false
    
    var body: some View {
        Text(type.rawValue.capitalized)
            .font(large ? .subheadline.bold() : .caption.bold())
            .padding(.horizontal, large ? 12 : 8)
            .padding(.vertical, large ? 6 : 4)
            .background(typeColor(for: type))
            .foregroundColor(.white)
            .cornerRadius(20)
    }
    
    func typeColor(for type: ElementType) -> Color {
        switch type {
        case .grass: return Color.green
        case .poison: return Color.purple
        case .fire: return Color.orange
        case .flying: return Color.blue.opacity(0.5)
        case .water: return Color.blue
        case .bug: return Color.green.opacity(0.7)
        case .normal: return Color.gray
        case .electric: return Color.yellow
        case .ground: return Color.brown
        case .fairy: return Color.pink
        case .psychic: return Color.pink.opacity(0.7)
        case .rock: return Color.gray.opacity(0.7)
        case .ice: return Color.cyan
        case .dragon: return Color.indigo
        case .dark: return Color.black
        case .steel: return Color.gray.opacity(0.5)
        case .fighting: return Color.red
        case .ghost: return Color.purple.opacity(0.5)
        }
    }
}

#Preview {
    HStack {
        TypeIconView(type: .fire)
        TypeIconView(type: .water, large: true)
    }
}


