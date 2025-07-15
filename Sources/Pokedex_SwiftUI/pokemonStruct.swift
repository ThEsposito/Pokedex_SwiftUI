import Foundation

struct Pokemons: Codable {
    let results: [Pokemon] 
    // results contém um vetor com todos os Pokemons da primeira geração
    // Porém, 
}

struct Pokemon: Codable, Identifiable {
    var id = UUID() // id é o índice no vetor results, mas tbem serve como oq vamos usar
    let name: String
    let url: String
}

class PokemonAPI {
    func fetchPokemons(completion: @escaping ([Pokemon]) -> ()) { // pq o parenteses dps da seta?
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"

        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro ao acessar a URL: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Erro na resposta. Código de status inesperado: \(response)")
                return
            }
            
            guard let data = data else {
                print("Dados não recebidos")
                return
            }
            
            do {
                let pokemonList = try JSONDecoder().decode(Pokemons.self, from: data)
                completion(pokemonList.results)
            } catch {
                print("Erro ao decodificar os dados: \(error)")
            }
        }.resume()
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Erro ao acessar a URL: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Erro na resposta. Código de status: \(response)")
                return
            }
            
            if let data = data, let pokemons = try? JSONDecoder().decode(Pokemons.self, from: data) {
                print(pokemons.results)
            }
        }
        task.resume()
    }
}
