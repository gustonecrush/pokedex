//
//  ContentView.swift
//  PokedexUI
//
//  Created by A Farhan Agustiansyah on 05/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                PokeSelectedAPI().getData(url: "https://pokeapi.co/api/pokemon/2/") {
                    url in
                    print(url)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
