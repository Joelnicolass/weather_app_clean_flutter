import 'package:clima/core/base/adapter.dart';
import 'package:clima/features/domain/entites/location.entity.dart';
import 'package:geolocator/geolocator.dart';

class LocationAdapter implements Adapter<Position, Location> {
  @override
  Location modelToEntity(Position model) {
    return Location(
      latitude: model.latitude,
      longitude: model.longitude,
    );
  }
}
