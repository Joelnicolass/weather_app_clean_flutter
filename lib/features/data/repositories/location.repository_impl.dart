import 'package:clima/core/base/adapter.dart';
import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/datasource/location.datasource.dart';
import 'package:clima/features/domain/entites/location.entity.dart';
import 'package:clima/features/domain/repositories/location.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource<Position> locationDataSource;
  final Adapter<Position, Location> locationAdapter;

  LocationRepositoryImpl({
    required this.locationDataSource,
    required this.locationAdapter,
  });

  @override
  Future<Either<Failure, Location>> getLocation() async {
    try {
      final Position position = await locationDataSource.getLocation();
      final Location location = locationAdapter.modelToEntity(position);

      return Right(location);
    } catch (e) {
      return Left(
        Failure('Error getting location'),
      );
    }
  }
}
