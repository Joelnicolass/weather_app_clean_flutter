import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/entites/location.entity.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getLocation();
}
