import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:forecast_weather_app/entity/forecast_weather/forecast_weather.dart';

class DetailsWeatherScreen extends StatelessWidget {
  final CityForecastWeather cityForecastWeather;

  const DetailsWeatherScreen({Key? key, required this.cityForecastWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(cityForecastWeather.city.name),
        backgroundColor: const Color.fromRGBO(105, 205, 255, 1),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: const [
                SizedBox(width: 20),
                Text('Время', style: textStyle),
                SizedBox(width: 50),
                Expanded(
                  child: Text(
                    'Температура',
                    style: textStyle,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 75,
                  child: Text(
                    'Скорость ветра',
                    style: textStyle,
                  ),
                ),
                SizedBox(width: 10),
                FittedBox(
                  child: Text(
                    'Влажность',
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                color: const Color.fromRGBO(105, 205, 255, 1),
                child: ListForecastWeather(
                    cityForecastWeather: cityForecastWeather)),
          ),
        ],
      ),
    );
  }
}

class ListForecastWeather extends StatelessWidget {
  final CityForecastWeather cityForecastWeather;

  const ListForecastWeather({Key? key, required this.cityForecastWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return ListView.builder(
        itemCount: cityForecastWeather.list.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 75,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: Text(DateFormat('H:mm, d MMM', "ru")
                        .format(DateTime.fromMillisecondsSinceEpoch(
                            cityForecastWeather.list[index].dt * 1000))
                        .toString()),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Text(
                        '${(cityForecastWeather.list[index].main.temp - 273.15).round()}ºC'),
                  ),
                  Expanded(
                    child: Text(
                        '${cityForecastWeather.list[index].wind.speed} м/с'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      '${cityForecastWeather.list[index].main.humidity}%'),
                  const SizedBox(
                    width: 35,
                  )
                ],
              ),
            ),
          );
        });
  }
}
