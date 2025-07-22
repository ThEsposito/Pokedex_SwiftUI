import SwiftUI


struct PokemonsView: View {
    func filterPokemons(search: String) -> [Pokemon] {
        if search.isEmpty {
            return pokemonsAPI
        }
        return pokemonsAPI.filter({
            return $0.name.localizedCaseInsensitiveContains(search)
        })
    }
    
    @State var pokemonsAPI: [Pokemon] = []
    
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(filterPokemons(search: text), id: \.id) { pokemon in
                    NavigationLink(destination: StatisticsView(pokemon: pokemon),
                                
                                   label: {
                        HStack {
                            AsyncImage(url:URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png")) { image in
                                image.image?.resizable()
                            }
                            .frame(width: 50, height: 50)
                            .padding(.leading)
                            Spacer()
                            Text(pokemon.name.capitalized)
                                .foregroundColor(.black)
                            Spacer()
                            Text("#\(pokemon.id)")
                                .padding(.trailing)
                                .foregroundColor(.black)
                        }
                        .frame(width: 370, height: 80)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                    })
                }
            }
            .scrollClipDisabled()
            .searchable(text: $text)
            
        }
        .onAppear {
            Task {
                for i in 0...151 {
                    var pokemon: Pokemon?
                    do {
                        pokemon = try await getPokemon(id: i)
                    } catch PokeError.invalidURL {
                        print("Invalid URL")
                    } catch PokeError.invalidResponse {
                        print("Invald Response")
                    } catch PokeError.invalidData {
                        print("Invalid Data")
                    } catch {
                        print("Unexpected error")
                    }
                    
                    if pokemon != nil {
                        pokemonsAPI.append(pokemon!)
                    }
                }
            }
        }
    }
    
}

#Preview {
    PokemonsView()
}
