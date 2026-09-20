import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

Future<void> getUserLocation(LocationData? userLocation, MapController mapController) async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
   

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    userLocation = await location.getLocation();
    mapController.move(LatLng(userLocation.latitude, userLocation.longitude), 17);
  }