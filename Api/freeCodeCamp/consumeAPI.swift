// Código adaptado de 
// https://www.freecodecamp.org/portuguese/news/como-fazer-uma-chamada-de-api-no-swift/

func fetchPokemons(id: Int, completionHandler: @escaping ([Pokemon]) -> Void) {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/" + "\(id)")!

    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if let error = error {
            print("Erro ao obter os pokémons: \(error)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
            print("Erro na responta. Código de status inesperado: \(response)")
            return
        }

        if let data = data,
            let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) {
            completionHandler([pokemon])
        }
    })
    task.resume()
}

