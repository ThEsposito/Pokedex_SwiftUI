import Foundation

struct PokemonDetalhado: Codable {
    let id: Int
    let name: String
    let types: [[String:Any]] // Não sei se é melhor fazer assim ou criar uma classe/struct própria pra isso
    let weight: Int //peso
    let height: Int // altura
}

class PokemonDetalhadoAPI {
    func fetchPokemons(url: String, completion: @escaping ([Pokemon]) -> ()) { // pq o parenteses dps da seta?
        guard let url = URL(string: url) else {
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
                let pokemonDetalhado = try JSONDecoder().decode(PokemonDetalhado.self, from: data)
                completion(pokemonDetalhado) 
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