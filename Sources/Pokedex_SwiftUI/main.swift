PokemonAPI().fetchPokemons { pokemons in
    for pokemon in pokemons {
        print("Pokemon: \(pokemon.name)")
        print("URL: \(pokemon.url)")
    }
}