// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getLocationHash() => r'd3716c2b3e3fee6f8527f0074da07d6604d82535';

/// See also [getLocation].
@ProviderFor(getLocation)
final getLocationProvider = FutureProvider<void>.internal(
  getLocation,
  name: r'getLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLocationRef = FutureProviderRef<void>;
String _$getWeatherByCurrentLocationHash() =>
    r'960c1c8700a6d83556ce5d528a31e7bd491a7788';

/// See also [getWeatherByCurrentLocation].
@ProviderFor(getWeatherByCurrentLocation)
final getWeatherByCurrentLocationProvider =
    FutureProvider<Either<Failure, Weather>>.internal(
  getWeatherByCurrentLocation,
  name: r'getWeatherByCurrentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getWeatherByCurrentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetWeatherByCurrentLocationRef
    = FutureProviderRef<Either<Failure, Weather>>;
String _$getForecastCurrentLocationHash() =>
    r'ab571ef13b2e27b9349e43f338460dcb24c40915';

/// See also [getForecastCurrentLocation].
@ProviderFor(getForecastCurrentLocation)
final getForecastCurrentLocationProvider =
    FutureProvider<Either<Failure, Forecast>>.internal(
  getForecastCurrentLocation,
  name: r'getForecastCurrentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getForecastCurrentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetForecastCurrentLocationRef
    = FutureProviderRef<Either<Failure, Forecast>>;
String _$weatherScreenViewModelHash() =>
    r'586ab0cad67d1e76c55ab11442dea8ed674e3af5';

/// See also [WeatherScreenViewModel].
@ProviderFor(WeatherScreenViewModel)
final weatherScreenViewModelProvider =
    AutoDisposeNotifierProvider<WeatherScreenViewModel, WeatherState>.internal(
  WeatherScreenViewModel.new,
  name: r'weatherScreenViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherScreenViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeatherScreenViewModel = AutoDisposeNotifier<WeatherState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
