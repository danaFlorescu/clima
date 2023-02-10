import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  //couple async + await allows other "process" to run while the other one is pending.
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      LocationPermission permission2 = await Geolocator.checkPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  // Future<void> getCurrentLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
