import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lust/models/library.dart';
import 'package:lust/models/location.dart';

class LocationAPI {

  static Future<Location> getLocation(GeoPoint _point) async {

    final double _maxRadius = 300;
    double _distance;
    bool _onRange;
    Library libHM =
        new Library(longitude: _point.longitude, latitude: _point.latitude);

    Position currentLocation = await Geolocator().getLastKnownPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(
        'USER coordinates: (${currentLocation.latitude}, ${currentLocation.longitude})');

    _distance = await Geolocator().distanceBetween(currentLocation.latitude,
        currentLocation.longitude, libHM.latitude, libHM.longitude);

    if (_distance < _maxRadius) {
      _onRange = true;
    } else {
      _onRange = false;
    }

    return new Location(distance: _distance, onRange: _onRange);
  }
}
