import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/ui/home/models/pokemons_generations.dart';
import 'package:pokedex/ui/home/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository = HomeRepository();

  final ValueNotifier<List<PokemonV2Pokemonspecies>> pokemonList =
      ValueNotifier(<PokemonV2Pokemonspecies>[]);

  final ValueNotifier<int> generationId = ValueNotifier(1);

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> getPokemonsByGeneration() async {
    isLoading.value = true;
    pokemonList.value = [];

    try {
      var pokemonGeneration = await _homeRepository.getPokemonsByGeneration(
        generationId.value,
      );

      pokemonList.value = pokemonGeneration.pokemonV2Pokemonspecies;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
