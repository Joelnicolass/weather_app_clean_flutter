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
import 'package:clima/features/presentation/components/forecast_list.dart';
import 'package:clima/features/presentation/components/city_and_temperature.dart';
import 'package:clima/features/presentation/components/header_animation.dart';
import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final ScrollController _scrollController = ScrollController();

  double _scrollPosition = 0;

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

    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerView(
          scrollController: _scrollController, scrollPosition: _scrollPosition),
    );
  }
}

class ContainerView extends StatelessWidget {
  const ContainerView({
    super.key,
    required ScrollController scrollController,
    required double scrollPosition,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blueAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeScrollAppBar(
          scrollController: _scrollController,
          pinned: true,
          fadeOffset: 1200,
          backgroundColor: Colors.blue.shade700,
          expandedHeight: MediaQuery.of(context).size.height * 0.6,
          fadeWidget: HeaderAnimation(),
          bottomWidget: CityAndTemperature(
            cityName: 'Buenos Aires',
            temperatureCelsius: 20.0,
          ),
          bottomWidgetHeight: MediaQuery.of(context).size.height * 0.2,
          appBarShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                140,
                20,
              ),
            ),
          ),
          child: ForecastList(),
        ));
  }
}
