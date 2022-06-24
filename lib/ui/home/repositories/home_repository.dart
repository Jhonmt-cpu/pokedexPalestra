import 'package:pokedex/app/services/api_config.dart';
import 'package:pokedex/ui/home/models/pokemons_generation.dart';

class HomeRepository {
  final ApiConfig _connect = ApiConfig();

  Future<PokemonsGeneration> getPokemonsByGeneration(int generationId) async {
    String pokemonByGenerationQuerry = """
    query pokeQuery(\$id:Int!){
      pokemon_v2_generation_by_pk(id: \$id) {
        pokemon_v2_pokemonspecies(order_by: {id: asc}) {
          name
          id
          pokemon_v2_pokemons {
            pokemon_v2_pokemontypes {
              pokemon_v2_type {
                name
              }
            }
          }
        }
      }
    }
    """;

    var response = await _connect.api.query(pokemonByGenerationQuerry, variables: {
      "id": generationId,
    });

    if (response["data"] == null) {
      throw Error();
    }

    PokemonsGeneration pokemonsGeneration = PokemonsGeneration.fromMap(
      response["data"]["pokemon_v2_generation_by_pk"],
    );

    return pokemonsGeneration;
  }
}
