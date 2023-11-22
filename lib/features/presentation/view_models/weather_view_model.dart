import 'package:clima/core/base/failure.dart';
import 'package:clima/features/data/adapters/location.adapter.dart';
import 'package:clima/features/data/adapters/weather.adapter.dart';
import 'package:clima/features/data/datasources/application/location.datasource_impl.dart';
import 'package:clima/features/data/datasources/remote/weather.datasource_impl.dart';
import 'package:clima/features/data/repositories/location.repository_impl.dart';
import 'package:clima/features/data/repositories/weather.repository_impl.dart';
import 'package:clima/features/domain/entites/forecast.entity.dart';
import 'package:clima/features/domain/entites/location.entity.dart';
import 'package:clima/features/domain/entites/weather.entity.dart';
import 'package:clima/features/domain/repositories/location.repository.dart';
import 'package:clima/features/domain/usecases/get_forecast_by_location.dart';
import 'package:clima/features/domain/usecases/get_location.dart';
import 'package:clima/features/domain/usecases/get_weather_by_location.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_view_model.g.dart';

class WeatherState {
  Weather? weather;
  Location? location;
  Forecast? forecast;

  WeatherState({
    required this.weather,
    required this.location,
    required this.forecast,
  });

  WeatherState copyWith({
    Weather? weather,
    Location? location,
    Forecast? forecast,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      location: location ?? this.location,
      forecast: forecast ?? this.forecast,
    );
  }
}

@riverpod
class WeatherScreenViewModel extends _$WeatherScreenViewModel {
  setLocation(Location location) {
    state = state.copyWith(location: location);
  }

  setWeather(Weather weather) {
    state = state.copyWith(weather: weather);
  }

  setForecast(Forecast forecast) {
    state = state.copyWith(forecast: forecast);
  }

  @override
  WeatherState build() {
    return WeatherState(
      weather: null,
      location: null,
      forecast: null,
    );
  }
}

@Riverpod(keepAlive: true)
Future<void> getLocation(GetLocationRef ref) async {
  final LocationRepository locationRepository = LocationRepositoryImpl(
      locationDataSource: LocationApplicationDataSource(),
      locationAdapter: LocationAdapter());

  final getLocation = GetLocationUseCase(
    repository: locationRepository,
  );

  final delay = Future.delayed(const Duration(seconds: 2));
  await delay;

  final result = await getLocation.execute();

  result.fold(
      (failure) => null,
      (location) => ref
          .read(weatherScreenViewModelProvider.notifier)
          .setLocation(location));
}

@Riverpod(keepAlive: true)
Future<Either<Failure, Weather>> getWeatherByCurrentLocation(
    GetWeatherByCurrentLocationRef ref) async {
  final weatherRepository = WeatherRepositoryImpl(
    weatherAdapter: WeatherAdapter(),
    weatherDataSource: WeatherDataSourceRemote(),
    forecastAdapter: WeatherWeekAdapter(),
  );

  final getWeather =
      GetWeatherByLocationUseCase(weatherRepository: weatherRepository);

  final location = ref.read(weatherScreenViewModelProvider).location;

  if (location == null) {
    return Left(Failure('Todavía no se ha obtenido la ubicación actual'));
  }

  print('location: ${location.latitude} ${location.longitude}');

  return await getWeather.execute(location.latitude, location.longitude);
}

@Riverpod(keepAlive: true)
Future<Either<Failure, Forecast>> getForecastCurrentLocation(
    GetForecastCurrentLocationRef ref) async {
  final weatherRepository = WeatherRepositoryImpl(
    weatherAdapter: WeatherAdapter(),
    weatherDataSource: WeatherDataSourceRemote(),
    forecastAdapter: WeatherWeekAdapter(),
  );

  final getForecast =
      GetForecastByLocationUseCase(weatherRepository: weatherRepository);

  final location = ref.read(weatherScreenViewModelProvider).location;

  if (location == null) {
    return Left(Failure('Todavía no se ha obtenido la ubicación actual'));
  }

  return await getForecast.execute(location.latitude, location.longitude);
}
