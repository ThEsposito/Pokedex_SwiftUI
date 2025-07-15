// Aqui, só vamos testar a requisição de alguns pokemons. Vai ser o escopo
// principal do programa para testar se as requisições estão funcionando bem.

// OBS: no SwiftUI, após o .padding, ele colocou ".task". Isso adiciona uma
// "Task Assíncrona (Async)" para performar antes da View ser renderizada:

/*
Seguiu-se o formato:

// Declara uma var de estado Pokemon? (Optional), 
@State private var user: Pokemon?
    *outros elementos ta tela*
    
    .task {
        // Tenta pegar as info do Pokemon especificado. Se der pau, cai no bloco do catch
        // O catch pode gerar algum popup (alert, talvez). Trata o erro de acordo com o
        // tipo dele (os casos da enum PokeError)
        do {
            user = try await getPokemon(id: (O pokemon q vc quiser))
        } catch PokeError.invalidURL {
            print("invalid url")
        } catch PokeError.invalidResponse {
            print("Invald Response")
        } catch PokeError.invalidData {
            print("Invalid Data")
        }

        // Ele tbem deu a ideia definir "Placeholders" padrão para os atributos que
        // estamos esperando. Serão mantidos caso o JSONController não os reatribua
    }
*/

/*
Ele também mostrou como exibe as imagens vindas em formato de URL (que a API disponibiliza) 
*/