// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherRepositoryHash() => r'2fa734d56992b9c647c1f09ff73007fccec930f8';

/// See also [weatherRepository].
@ProviderFor(weatherRepository)
final weatherRepositoryProvider =
    AutoDisposeProvider<WeatherRepository>.internal(
  weatherRepository,
  name: r'weatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherRepositoryRef = AutoDisposeProviderRef<WeatherRepository>;
String _$locationRepositoryHash() =>
    r'2237d701e47769bad1775955b5c7495a4365d051';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider =
    AutoDisposeProvider<LocationRepository>.internal(
  locationRepository,
  name: r'locationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationRepositoryRef = AutoDisposeProviderRef<LocationRepository>;
String _$getWeatherByLocationHash() =>
    r'723ef6e396f9614e4dccc40252359609b73a480d';

/// See also [getWeatherByLocation].
@ProviderFor(getWeatherByLocation)
final getWeatherByLocationProvider =
    AutoDisposeProvider<GetWeatherByLocationUseCase>.internal(
  getWeatherByLocation,
  name: r'getWeatherByLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getWeatherByLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetWeatherByLocationRef
    = AutoDisposeProviderRef<GetWeatherByLocationUseCase>;
String _$getLocationHash() => r'157afcfafb0a396f1c8a833e08fd4c5fe96eab5f';

/// See also [getLocation].
@ProviderFor(getLocation)
final getLocationProvider = AutoDisposeProvider<GetLocationUseCase>.internal(
  getLocation,
  name: r'getLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLocationRef = AutoDisposeProviderRef<GetLocationUseCase>;
String _$getForecastByLocationHash() =>
    r'd0a74bdb0692a16d1958ad73204c6a45f1cdde09';

/// See also [getForecastByLocation].
@ProviderFor(getForecastByLocation)
final getForecastByLocationProvider =
    AutoDisposeProvider<GetForecastByLocationUseCase>.internal(
  getForecastByLocation,
  name: r'getForecastByLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getForecastByLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetForecastByLocationRef
    = AutoDisposeProviderRef<GetForecastByLocationUseCase>;
String _$weatherNotifierHash() => r'85deb65ea3d7dce50c4241fe7fddee54fb87c8cc';

/// See also [WeatherNotifier].
@ProviderFor(WeatherNotifier)
final weatherNotifierProvider =
    AutoDisposeNotifierProvider<WeatherNotifier, WeatherState>.internal(
  WeatherNotifier.new,
  name: r'weatherNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeatherNotifier = AutoDisposeNotifier<WeatherState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
