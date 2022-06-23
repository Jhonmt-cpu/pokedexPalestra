import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/app/components/gradient_icon.dart';
import 'package:pokedex/app/helpers/styles/app_colors.dart';
import 'package:pokedex/app/helpers/styles/app_gradients.dart';
import 'package:pokedex/app/helpers/styles/app_images.dart';
import 'package:pokedex/app/helpers/styles/app_text_styles.dart';
import 'package:pokedex/app/helpers/values/strings.dart';
import 'package:pokedex/app/utils/open_sliding_sheet.dart';
import 'package:pokedex/ui/home/components/generation_tab.dart';
import 'package:pokedex/ui/home/components/pokemon_item.dart';
import 'package:pokedex/ui/home/controller/home_controller.dart';
import 'package:pokedex/ui/home/models/pokemons_generations.dart';
import 'package:pokedex/ui/home/repositories/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    controller.getPokemonsByGeneration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var navBarHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -(screenWidth / 2),
            child: GradientIcon(
              icon: AppImages.pokeball,
              size: screenWidth,
              gradient: AppGradients.gradientPokeball,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              right: 40,
              left: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        openSlidingSheet(
                          context,
                          ValueListenableBuilder<int>(
                            valueListenable: controller.generationId,
                            builder: (context, generationId, child) {
                              return GenerationTab(
                                generationId: generationId,
                                changeGeneration: (generationId) {
                                  controller.generationId.value = generationId;
                                  controller.getPokemonsByGeneration();
                                },
                              );
                            },
                          ),
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: SvgPicture.asset(
                        AppImages.generation,
                        color: AppColors.textBlack,
                        width: 25,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 35,
                    bottom: 10,
                  ),
                  child: Text(
                    Strings.homeTitle,
                    style: AppTextStyles.applicationTitle,
                  ),
                ),
                const Text(
                  Strings.homeSearchInfo,
                  style: AppTextStyles.description,
                ),
                Expanded(
                    child: ValueListenableBuilder<List<PokemonV2Pokemonspecies>>(
                  valueListenable: controller.pokemonList,
                  builder: (context, pokemonList, child) {
                    if (pokemonList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.only(
                        top: 0,
                        bottom: navBarHeight,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: pokemonList.length,
                      itemBuilder: (context, index) {
                        return PokemonItem(pokemon: pokemonList[index]);
                      },
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
