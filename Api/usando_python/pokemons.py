import requests

# Essa função vai pegar os dados do json por completo
def fetch_data(endpoint):
    url = f"https://pokeapi.co/api/v2/pokemon/{endpoint}" # Cuidado c oq passa como endpoint
    response = requests.get(url)

    if response.status_code == 200:
        return response.json()
    else:
        return None
    
def pega_info(status, id):    
    results = fetch_data(id)
    if results:
        return f"name: {results["name"]}"

    else:
        return "None CARALHOOOO"


# Isso daqui demora imensamente, porque faço f*ing 152 requisições
# Talvez seja mais interessante fazer uma vez só pra todos os pokemons de uma vez
# (aql esquema do limite até 152) e tratar depois disso

# Infelizmente, esse esquema q comentei só disponibiliza nome e a url para o pokemon
# especificado, então seriam necessárias o mesmo numero de requisicoes

for id in range(0, 5):
    pokemon_atual = fetch_data(id)
    print(type(pokemon_atual))
    if pokemon_atual:
        print("Nome: ", pokemon_atual["name"])
        print("ID: ", pokemon_atual["id"])
        print("Tipagens: ")

        tipos = pokemon_atual["types"]

        for tipo in tipos:
            print("    ", tipo["type"]['name'])

        print()

