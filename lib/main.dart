import 'package:flutter/material.dart';
import 'LoginPage.dart';
// import the new page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      //routes: { // add a named route to the HomePage
      //         '/home': (context) => const HomePage(),
      //       },
    );
  }
}
