//
//  PokemonImage.swift
//  PokedexUI
//
//  Created by A Farhan Agustiansyah on 05/02/23.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: pokemonSprite))
                .frame(width: 75, height: 75)
                .onAppear {
                    let loadedData = UserDefaults.standard.string(forKey: imageLink)
                    if loadedData == nil {
                        getSprite(url: imageLink)
                        UserDefaults.standard.set(imageLink, forKey: imageLink)
                        print("New URL!!! Caching...")
                    } else {
                        getSprite(url: loadedData!)
                        print("Using cached URL...")
                    }
                }
                .clipShape(Circle())
                .foregroundColor(Color.gray.opacity(0.60))
        } else {
            // Fallback on earlier versions
        }
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        
        PokeSelectedAPI().getData(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
    }
}
