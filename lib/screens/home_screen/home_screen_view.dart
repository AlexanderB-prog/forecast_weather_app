import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_weather_app/navigation/main_navigation.dart';
import 'package:forecast_weather_app/screens/home_screen/home_screen_view_res.dart';

import 'home_screen_bloc.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is NavigationHomeScreenState) {
            Navigator.of(context)
                .pushReplacementNamed(Screens.weatherScreen, arguments: state.cityWeather);
          }
          if (state is ErrorHomeScreenState) {
            Scaffold.of(context).showBottomSheet(
              (context) => GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 100,
                  color: Colors.red,
                  child: Text(
                    state.text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              HomeScreenViewRes.screenName,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextFieldCityWidget(),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll<Color>(Color.fromRGBO(0, 92, 138, 1)),
              ),
              onPressed: () => context.read<HomeScreenBloc>().add(NavigationHomeScreenEvent()),
              child: const Text(
                HomeScreenViewRes.nameButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldCityWidget extends StatelessWidget {
  const TextFieldCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (text) => context.read<HomeScreenBloc>().add(NavigationHomeScreenEvent()),
      onChanged: (text) => context.read<HomeScreenBloc>().add(OnChangedHomeScreenEvent(text)),
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintStyle: const TextStyle(fontSize: 12),
        hintText: HomeScreenViewRes.hintText,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
