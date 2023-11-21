import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/entites/weather.entity.dart';
import 'package:clima/features/domain/repositories/weather.repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherByLocationUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherByLocationUseCase({
    required this.weatherRepository,
  });

  Future<Either<Failure, Weather>> execute(double lat, double loc) async {
    return await weatherRepository.getWeatherByLocation(lat, loc);
  }
}
