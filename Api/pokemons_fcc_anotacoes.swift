// API utilizada pro catálogo dos Pokémons:
//      https://pokeapi.co/

/* O manipulador de conclusão (completionHandler) "avisa" quando a API termina de 
fornecer os dados solicitados, para que o restante do programa não fique esperando 
pelo fim da requisição.
Assim, o app pode fazer outras coisas como carregar o resto da página
*/
func fetchFilms(completionHandler: @escaping([Film]) -> Void) { 
    // URLSession gerencia o trabalho das datatasks
    // Toda vez que precisar de algum dado, use:
    // URLSession.shared.datatask

    // Dá pra dar diversos tipos de informações pras datatasks pra inicializá-las
    // Vou fazer isso com URL's
    // Obs: Datatasks tbem usam Manipuladores de Conclusão

    let urlBase = URL(string: "https://pokeapi.co/api/v2/pokemon/")
    let task = URLSession.shared.datatask(with: urlBase, completionHandler: { (data, response, error) in
        // Detalhes no fim do código sobre o trecho acima
        if let error = error {
            print("Erro ao acessar a URL: \(error)")
            return
        }

    /*
        guard let response = response else { O site n usou esse trecho
            print("Response vazia")
            return
        }
    */

        // Converter a response para o tipo httpResponse, para poder ver os códigos
        // de status e tomar decisões em cima deles.
        guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(htttResponse.statusCode) else {
            print("Erro na resposta. Código de status: \(response)")
            return
        }
        // print(type(of: response))
        // print(type(of: httpResponse))

        if let data = data, let filmSumary = try? JSONDecoder().decode(filmSummary.self, from: data) {
            completionHandler(filmSumary.results ?? [])
            // Conferindo se data não é nil??
        }
    })
    task.resume()

    // Chamar a API com algum código
    
    // Usar os dados da API, atribuir um valor a lotsOfFilms

    // Dar ao manipulador de conclusão a variável lotsOfFilms
    completionHandler(lotsOfFilms)
}



// Dps das chaves, estamos usando um CLOSURE
// (data, response, error) são os parametros de entrada que a closure espera receber 
// Nesse caso, a URLSession fornecerá esses valores quando a task (de rede) for concluída.
// data (do tipo Data? (optional)) se refere aos dados baixados pela URL
// response (do tipo URLResponse?) é o código de status do HTTP
// error (do tipo Error?) indica se deu algum erro na requisição de rede

// in (A keyword): é um separador. Tudo o que vem antes de in são os parâmetros de entrada 
// da closure. Tudo o que vem depois de in é o corpo da closure (o código que será 
// executado).

// Todos são Optionals, então podemos tratá-los com facilidade