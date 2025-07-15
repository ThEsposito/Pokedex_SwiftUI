// Dessa vez, vou fazer apenas o consumo individual de cada pokemon, com as 
// infos detalhadas

// Modelos de 

struct PokemonV2: Codable {
    let id: Int
    let name: String
    let types: [TypeInfo]
    let abilities: [Ability]
    let weight: Int // peso
    let height: Int // altura

    let sprites: Sprite // Imagens

    // Atributos que não são de classes nativas do Swift (types, abilities e sprites)
    // podem dar/causar erro ou só não funcionar, já que não fiz um JSONDecoder especificamente
    // pra elas. Na dúvida, comente elas. 

/*Pode ser interessante:
    - Transformar tudo em classes
    - Implementar Getters para os "atributos não nativos" mencionados e usá-los no 
      construtor de pokémon (se não afetar o JSONDecoder).
*/  
}


struct TypeInfo: Codable {
    let slot: String
    let type: TypeDetail
}

struct TypeDetail: Codable {
    let name: String // O que nos interessa é isso daqui
    let url: String
}


struct Ability: Codable {
    let ability: AbilityDetail
    let isHidden: Bool // // Vem do SnakeCase
    let slot: Int
}

struct AbilityDetail: Codable {
    let name: String
    let url: String
}

// URL's para as imagens 
struct Sprite: Codable {
    let frontDefault: String // Vem do SnakeCase
    // front_default é uma url que leva para a imagem padrão do Pokemon
    // Nesse caso, é de frente, mas tbem existem outras opções.
    // RESOLUÇÃO PEQUENA!!!!
    // Para resolução maior, use o link de:
    //      sprite.other.officialArtwork.front_default
    let other: OtherSprite
}

struct OtherSprite: Codable {
    let officialArtwork: OfficialArtwork // // Vem do SnakeCase
}

struct OfficialArtwork: Codable {
    let frontDefault: String // Url para a imagem
    // Vem do SnakeCase 
}