import 'package:dice_app/components/splash.dart';
import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'components/scaffold_wrapper.dart';

void main() {
  runApp(const MyApp());
}

/*
Todo: change the home to be dynamic
So that when the user clicks on the roll button the next screen will
be the results screen (home is kind of like a splash screen)
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const ScaffoldWrapper(Splash()),
    );
  }
}
