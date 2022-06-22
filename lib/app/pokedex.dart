import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/app/components/dismiss_keyboard.dart';
import 'package:pokedex/app/helpers/styles/app_colors.dart';
import 'package:pokedex/ui/home/view/home_page.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mySystemTheme = const SystemUiOverlayStyle().copyWith(
      systemNavigationBarColor: AppColors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    return DismissKeyboard(
      child: MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
