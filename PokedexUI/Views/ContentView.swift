//
//  ContentView.swift
//  PokedexUI
//
//  Created by A Farhan Agustiansyah on 05/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(searchText == "" ? pokemon : pokemon.filter({
                        $0.name.contains(searchText.lowercased())
                    })) { entry in
                        HStack {
                            PokemonImage(imageLink: "\(entry.url)").padding(.trailing, 20)
                            // pokemon image
                            NavigationLink("\(entry.name)".capitalized, destination: Text("Detail view for \(entry.name)"))
                        }
                    }
                }
                .onAppear {
                    PokeAPI().getData() { pokemon in
                        self.pokemon = pokemon
                        
                        for pokemon in pokemon {
                            print(pokemon.name)
                        }
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Pokedex")
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
