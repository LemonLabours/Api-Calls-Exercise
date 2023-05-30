import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    func fetchPokemons() async {
//-------------------------------------------------
        // # create url
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            print("Hey Girl, THIS URL is not working! ")
            return
        }
//-------------------------------------------------
        // # fetch data from the url
        
        do  {
            let (data, _) = try await URLSession.shared.data(from: url)
            // decode that data
            let decodedResponse = try JSONDecoder().decode(PokemonListResponse.self, from: data)
            pokemons = decodedResponse.results
        } //do fetch
        catch {
            print("Error decoding Pokemon: \(error)")
        }
    }//func load data
}

