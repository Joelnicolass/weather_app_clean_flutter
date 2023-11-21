import 'package:clima/core/base/adapter.dart';
import 'package:clima/core/base/failure.dart';
import 'package:clima/features/data/models/weather.model.dart';
import 'package:clima/features/data/models/weather_week.model.dart';
import 'package:clima/features/domain/datasource/weather.datasource.dart';
import 'package:clima/features/domain/entites/forecast.entity.dart';
import 'package:clima/features/domain/entites/weather.entity.dart';
import 'package:clima/features/domain/repositories/weather.repository.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource<WeatherModel, WeatherWeekModel> weatherDataSource;
  final Adapter<WeatherModel, Weather> weatherAdapter;
  final Adapter<WeatherWeekModel, Forecast> forecastAdapter;

  WeatherRepositoryImpl({
    required this.weatherDataSource,
    required this.weatherAdapter,
    required this.forecastAdapter,
  });

  @override
  Future<Either<Failure, Weather>> getWeatherByLocation(
      double lat, double loc) async {
    try {
      print('getting weather by location');

      final weatherModel =
          await weatherDataSource.getWeatherByLocation(lat, loc);

      final weather = weatherAdapter.modelToEntity(weatherModel);

      return Right(weather);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Forecast>> getForecastByLocation(
      double lat, double loc) async {
    try {
      final weatherWeekModel =
          await weatherDataSource.getForecastByLocation(lat, loc);

      final forecast = forecastAdapter.modelToEntity(weatherWeekModel);

      return Right(forecast);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }
}
