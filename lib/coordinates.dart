import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double long;
  Future getcurrentlocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat=position.latitude;
      long=position.longitude;
      return [lat,long];
    } catch (e) {
      print(e);
    }
  }
}