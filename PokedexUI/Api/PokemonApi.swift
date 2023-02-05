//
//  PokemonApi.swift
//  PokedexUI
//
//  Created by A Farhan Agustiansyah on 05/02/23.
//  https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation

struct Pokemon : Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable{
    let id = UUID()
    var name: String
    var url: String
}

class PokeAPI {
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}


// Things you need to find
// 1. Codable
// 2. Import Foundation
// 3. Identifiable
// 4. UUID()
// 5. How to create sturct and what is that
// 6. completion, @escaping, guard
