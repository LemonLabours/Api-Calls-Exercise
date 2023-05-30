import SwiftUI
struct Pokemon: Codable, Hashable {
    let name: String
}

struct PokemonListResponse: Codable {
    let results: [Pokemon]
}
