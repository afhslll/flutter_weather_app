import 'package:flutter_weather_app/core/model/city.dart';
import 'package:geocoding/geocoding.dart' as geocoder;
import 'package:geolocator/geolocator.dart';

abstract class LocationService {
  Future<City> getCurrentLocation();
}

class LocationServiceImpl implements LocationService {
  LocationPermission _permissionStatus;

  @override
  Future<City> getCurrentLocation() async {
    try {
      await _setupLocationPermission();
      if (_permissionStatus == LocationPermission.whileInUse ||
          _permissionStatus == LocationPermission.always) {
        final locationData =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        if (locationData != null) {
          final placemark = await getAddressFromCoordinate(
              latitude: locationData.latitude,
              longitude: locationData.longitude);
          return City(
            name: placemark?.name ?? '',
            state: placemark?.administrativeArea ?? '',
            latitude: locationData.latitude,
            longitude: locationData.longitude,
          );
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('getCurrentLocation: ${e.toString()}');
      return null;
    }
  }

  Future<geocoder.Placemark> getAddressFromCoordinate(
      {double latitude, double longitude}) async {
    try {
      final List<geocoder.Placemark> placemarks =
          await geocoder.placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks.first;
      }
      return null;
    } catch (e) {
      print('getAddressFromCoordinate: ${e.toString()}');
      return null;
    }
  }

  Future<void> _setupLocationPermission() async {
    if (await isLocationServiceEnabled()) {
      _permissionStatus = await checkPermission();
      if (_permissionStatus == LocationPermission.denied ||
          _permissionStatus == LocationPermission.deniedForever) {
        _permissionStatus = await requestPermission();
      }
    } else {
      return;
    }
  }
}
