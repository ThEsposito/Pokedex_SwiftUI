import SwiftUI
// "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png"
struct StatisticsView: View {
    @State var pokemon : Pokemon
    
    var body: some View {
            VStack {
                AsyncImage(url:URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemon.id).png")) { image in
                    image.image?.resizable()
                }
                .frame(width: 200, height: 200)
                .padding(.leading)
                Text(pokemon.name.capitalized)
                Text("# ID \(pokemon.id)")
                Spacer()
                HStack {
                    Spacer()
                    Text("  Height: \(pokemon.height)")
                    Spacer()
                    Text("  Weight: \(pokemon.weight)")
                    Spacer()
                }
                Spacer()
                Spacer()
            }
            .padding()
    }
}

#Preview {
    StatisticsView(pokemon: Pokemon(id: 1, name: "bulbasauro", weight: 12, height: 14))
}


