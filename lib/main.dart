import 'package:flutter/material.dart';
import 'package:forecast_weather_app/navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(105, 205, 255, 1),
        appBarTheme: const AppBarTheme(
         toolbarTextStyle: TextStyle(color: Colors.white),
          elevation: 0,
          color: Color.fromRGBO(105, 205, 255, 1),
          iconTheme: IconThemeData(color: Colors.white),

            actionsIconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      initialRoute: Screens.main,
      routes: MainNavigation().routes,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}
