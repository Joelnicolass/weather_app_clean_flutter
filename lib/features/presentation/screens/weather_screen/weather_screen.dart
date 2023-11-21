import 'package:clima/features/data/adapters/location.adapter.dart';
import 'package:clima/features/data/adapters/weather.adapter.dart';
import 'package:clima/features/data/datasources/application/location.datasource_impl.dart';
import 'package:clima/features/data/datasources/remote/weather.datasource_impl.dart';
import 'package:clima/features/data/repositories/location.repository_impl.dart';
import 'package:clima/features/data/repositories/weather.repository_impl.dart';
import 'package:clima/features/domain/repositories/location.repository.dart';
import 'package:clima/features/domain/usecases/get_forecast_by_location.dart';
import 'package:clima/features/domain/usecases/get_location.dart';
import 'package:clima/features/domain/usecases/get_weather_by_location.dart';
import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    final weatherRepository = WeatherRepositoryImpl(
      weatherAdapter: WeatherAdapter(),
      weatherDataSource: WeatherDataSourceRemote(),
      forecastAdapter: WeatherWeekAdapter(),
    );

    final getWeather =
        GetWeatherByLocationUseCase(weatherRepository: weatherRepository);

    final LocationRepository locationRepository = LocationRepositoryImpl(
        locationDataSource: LocationApplicationDataSource(),
        locationAdapter: LocationAdapter());

    final getLocation = GetLocationUseCase(
      repository: locationRepository,
    );

    final getForecast =
        GetForecastByLocationUseCase(weatherRepository: weatherRepository);

    getLocation.execute().then((value) {
      value.fold(
        (failure) => print(failure.message),
        (location) => getWeather
            .execute(location.latitude, location.longitude)
            .then((value) {
          value.fold(
            (failure) => print(failure.message),
            (weather) {
              print(weather.cityName);
              print(weather.temperatureCelsius);
              print(weather.condition);
            },
          );
        }),
      );
    });

    getLocation.execute().then((value) {
      value.fold(
        (failure) => print(failure.message),
        (location) => getForecast
            .execute(location.latitude, location.longitude)
            .then((value) {
          value.fold(
            (failure) => print(failure.message),
            (forecast) {
              print(forecast.cityName);
              print(forecast.forecastDays.map((e) => e.date));
            },
          );
        }),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return FadeScrollAppBar(
      scrollController: _scrollController,
      appBarForegroundColor: Colors.amber,
      pinned: true,
      fadeOffset: 120,
      expandedHeight: 250,
      backgroundColor: Colors.white,
      fadeWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Really Good App Bar"),
        ],
      ),
      bottomWidgetHeight: 40,
      appBarShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      bottomWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
      child: Container(color: Color.fromARGB(255, 190, 0, 1)),
    );
  }
}
