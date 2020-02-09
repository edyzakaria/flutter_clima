import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      //I add a .timeout function to limit api call.
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low).timeout(Duration(seconds: 3));
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Exception: $e');
    }
  }

}