import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/entites/forecast.entity.dart';
import 'package:clima/features/domain/entites/weather.entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByLocation(double lat, double loc);
  Future<Either<Failure, Forecast>> getForecastByLocation(
      double lat, double loc);
}
