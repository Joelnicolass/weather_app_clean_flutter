import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/entites/forecast.entity.dart';
import 'package:clima/features/domain/repositories/weather.repository.dart';
import 'package:dartz/dartz.dart';

class GetForecastByLocationUseCase {
  final WeatherRepository weatherRepository;

  GetForecastByLocationUseCase({
    required this.weatherRepository,
  });

  Future<Either<Failure, Forecast>> execute(double lat, double loc) async {
    return await weatherRepository.getForecastByLocation(lat, loc);
  }
}
