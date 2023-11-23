import 'package:clima/features/presentation/components/forecast_list.dart';
import 'package:clima/features/presentation/components/city_and_temperature.dart';
import 'package:clima/features/presentation/components/header_animation.dart';
import 'package:clima/features/presentation/view_models/weather_view_model.dart';
import 'package:clima/helpers/helper.dart';
import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends ConsumerState<WeatherScreen> {
  final ScrollController _scrollController = ScrollController();

  double _scrollPosition = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });

    ref.read(weatherNotifierProvider.notifier).getLocation();

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

class ContainerView extends ConsumerStatefulWidget {
  const ContainerView({
    super.key,
    required ScrollController scrollController,
    required double scrollPosition,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  ContainerViewState createState() => ContainerViewState();
}

class ContainerViewState extends ConsumerState<ContainerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = ref.watch(weatherNotifierProvider);

    if (weatherViewModel.location == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weatherViewModel.weather == null) {
      ref.read(weatherNotifierProvider.notifier).getWeatherByLocation();

      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weatherViewModel.forecast == null) {
      ref.read(weatherNotifierProvider.notifier).getForecastByLocation();
    }

    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeScrollAppBar(
          scrollController: widget._scrollController,
          pinned: true,
          fadeOffset: 1200,
          backgroundColor: getBackgroundColorFromTemperature(
              weatherViewModel.weather!.temperatureCelsius),
          expandedHeight: MediaQuery.of(context).size.height * 0.6,
          fadeWidget: HeaderAnimation(),
          bottomWidget: CityAndTemperature(
            cityName: weatherViewModel.weather?.cityName ?? '',
            temperatureCelsius:
                weatherViewModel.weather?.temperatureCelsius ?? 0.0,
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
