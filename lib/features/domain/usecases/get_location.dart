import 'package:clima/core/base/failure.dart';
import 'package:clima/features/domain/entites/location.entity.dart';
import 'package:clima/features/domain/repositories/location.repository.dart';
import 'package:dartz/dartz.dart';

class GetLocationUseCase {
  final LocationRepository repository;

  GetLocationUseCase({
    required this.repository,
  });

  Future<Either<Failure, Location>> execute() async {
    return await repository.getLocation();
  }
}
