import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/entites/weather.entity.dart';
import 'package:clima/features/domain/repositories/weather.repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherByLocationUseCase {
  final WeatherRepository repository;

  GetWeatherByLocationUseCase({
    required this.repository,
  });

  Future<Either<Failure, Weather>> execute(double lat, double loc) async {
    return await repository.getWeatherByLocation(lat, loc);
  }
}
