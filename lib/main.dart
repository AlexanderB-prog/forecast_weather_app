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
      //Описание стандартные цвета для scaffoldBackground, AppBar, иконок в AppBar
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(105, 205, 255, 1),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color.fromRGBO(105, 205, 255, 1),
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
      ),

      //Первоначальный экран загрузки, маршруты фиксированные и генерируемые с параметрами
      initialRoute: Screens.main,
      routes: MainNavigation().routes,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}
