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
        primarySwatch: Colors.blue,
      ),
      initialRoute: Screens.main,
      routes: MainNavigation().routes,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}

