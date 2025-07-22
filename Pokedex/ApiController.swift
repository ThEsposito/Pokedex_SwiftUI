//
//  ApiController.swift
//  Theo_PokedexV3
//
//  Created by Aluno Mack on 16/07/25.
//

import Foundation
func getPokemon(id: Int) async throws -> Pokemon {
    let endpoint = "https://pokeapi.co/api/v2/pokemon/\(id)"

    guard let url = URL(string: endpoint) else { throw PokeError.invalidURL }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw PokeError.invalidResponse
    }

    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(Pokemon.self, from: data)
    } catch {
        throw PokeError.invalidData
    }

}

enum PokeError: Error {
    case invalidURL
    case invalidResponse
    case invalidData

}
