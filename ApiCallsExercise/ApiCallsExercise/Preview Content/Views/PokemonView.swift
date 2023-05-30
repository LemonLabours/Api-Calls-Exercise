//
//  PokemonView.swift
//  ApiCallsExercise
//
//  Created by Lama AL Yousef on 30/05/2023.
//PokemonViewModel


import SwiftUI

struct PokemonView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.pokemons, id: \.self) { pokemon in
                VStack(alignment: .leading) {
                
                    Text("\(pokemon.name)")
                        .font(.title)
                }
            }
            .navigationTitle("Pokemons")
        }
        .onAppear {
            Task {
                await viewModel.fetchPokemons()
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
