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
import 'package:clima/features/domain/repositories/weather.repository.dart';
import 'package:clima/features/domain/usecases/get_forecast_by_location.dart';
import 'package:clima/features/domain/usecases/get_location.dart';
import 'package:clima/features/domain/usecases/get_weather_by_location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_view_model.g.dart';

// Inyeccion de dependencias para la construccion de los casos de uso

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepositoryImpl(
    weatherDataSource: WeatherDataSourceRemote(),
    weatherAdapter: WeatherAdapter(),
    forecastAdapter: WeatherWeekAdapter(),
  );
}

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepositoryImpl(
    locationDataSource: LocationApplicationDataSource(),
    locationAdapter: LocationAdapter(),
  );
}

@riverpod
GetWeatherByLocationUseCase getWeatherByLocation(GetWeatherByLocationRef ref) {
  final repository = ref.watch(weatherRepositoryProvider);

  return GetWeatherByLocationUseCase(repository: repository);
}

@riverpod
GetLocationUseCase getLocation(GetLocationRef ref) {
  final repository = ref.watch(locationRepositoryProvider);

  return GetLocationUseCase(repository: repository);
}

@riverpod
GetForecastByLocationUseCase getForecastByLocation(
    GetForecastByLocationRef ref) {
  final repository = ref.watch(weatherRepositoryProvider);

  return GetForecastByLocationUseCase(weatherRepository: repository);
}

// Clase que modela el estado de la vista
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

// Provider que contiene el estado de la vista y llama a los casos de uso

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  getLocation() async {
    final result = await ref.read(getLocationProvider).execute();

    result.fold(
      (failure) => null,
      (location) => state = state.copyWith(location: location),
    );
  }

  getWeatherByLocation() async {
    if (state.location == null) {
      return;
    }

    final result = await ref
        .read(getWeatherByLocationProvider)
        .execute(state.location!.latitude, state.location!.longitude);

    result.fold(
      (failure) => null,
      (weather) => state = state.copyWith(weather: weather),
    );
  }

  getForecastByLocation() async {
    if (state.location == null) {
      return;
    }

    final result = await ref
        .read(getForecastByLocationProvider)
        .execute(state.location!.latitude, state.location!.longitude);

    result.fold(
      (failure) => null,
      (forecast) => state = state.copyWith(forecast: forecast),
    );
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
