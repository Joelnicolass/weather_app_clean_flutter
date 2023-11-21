import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/datasource/location.datasource.dart';
import 'package:clima/features/domain/entites/location.entity.dart';
import 'package:clima/features/domain/repositories/location.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource<Position> locationDataSource;

  LocationRepositoryImpl({
    required this.locationDataSource,
  });

  @override
  Future<Either<Failure, Location>> getLocation() async {
    try {
      final location = await locationDataSource.getLocation();

      return Right(
          Location(latitude: location.latitude, longitude: location.longitude));
    } catch (e) {
      return Left(
        Failure('Error getting location'),
      );
    }
  }
}
