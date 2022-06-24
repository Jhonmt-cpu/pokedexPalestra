import 'package:flutter/foundation.dart';
import 'package:pokedex/ui/home/models/pokemons_generation.dart';
import 'package:pokedex/ui/home/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository = HomeRepository();

  final ValueNotifier<List<PokemonV2Pokemonspecies>> pokemonList = ValueNotifier([]);

  final ValueNotifier<int> generationId = ValueNotifier(1);

  Future<void> getPokemonsByGeneration() async {
    pokemonList.value = <PokemonV2Pokemonspecies>[];

    try {
      var pokemonGeneration = await _homeRepository.getPokemonsByGeneration(
        generationId.value,
      );

      pokemonList.value = pokemonGeneration.pokemonV2Pokemonspecies;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
