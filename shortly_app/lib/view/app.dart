import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_code_api_package/short_code_api_repository.dart';
import 'package:shortly_app/home/home.dart';

final veryDarkBlue = const HSLColor.fromAHSL(1, 255, .11, .22).toColor();
final veryDarkViolet = const HSLColor.fromAHSL(1, 260, .08, .14).toColor();
final gray = const HSLColor.fromAHSL(1, 0, 0, .65).toColor();
final grayishViolet = const HSLColor.fromAHSL(.2, 257, .07, .63).toColor();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = const HSLColor.fromAHSL(1, 180, .66, .49).toColor();
    final onPrimaryColor = const HSLColor.fromAHSL(1, 0, 0, 1).toColor();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: primaryColor,
          primaryContainer: const HSLColor.fromAHSL(1, 257, .27, .26).toColor(),
          secondary: const HSLColor.fromAHSL(1, 0, .87, .67).toColor(),
          surface: const HSLColor.fromAHSL(1, 0, 0, 1).toColor(),
          background: const HSLColor.fromAHSL(1, 0, 0, 1).toColor(),
          error: const HSLColor.fromAHSL(1, 0, .87, .67).toColor(),
          onPrimary: onPrimaryColor,
          onSecondary: const HSLColor.fromAHSL(1, 0, 0, 1).toColor(),
          onSurface: const Color.fromARGB(255, 53, 53, 53),
          onBackground: const Color.fromARGB(255, 39, 39, 39),
          onError: const HSLColor.fromAHSL(1, 0, 0, 1).toColor(),
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          bodyLarge: const TextStyle(fontSize: 18),
          headlineLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          headlineSmall: TextStyle(
            color: gray,
            fontFamily: 'Poppins',
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(gray),
          ),
        ),
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            foregroundColor: MaterialStateProperty.all(onPrimaryColor),
          ),
        ),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ShortCodeApiRepository>(
            create: (context) => const ShortCodeApiRepository(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
