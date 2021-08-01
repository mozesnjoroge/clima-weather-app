import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      //Location accuracy set to low to conserve battery consumption
      latitude = position.latitude;
      longitude = position.longitude;
      print('Latitude : $latitude, Longitude : $longitude');
    } catch (e) {
      print(e);
    }
  }
}
