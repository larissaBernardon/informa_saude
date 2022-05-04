import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'map_controller.g.dart';

class MapController = _MapController with _$MapController;

abstract class _MapController with Store {
  Location location = Location();
  LocationData? currentLocation;

  Future getInitialLocation() async {
    var _serviceEnabled = await location.serviceEnabled();
    var _permissionStatus = await location.hasPermission();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    LocationData response = await location.getLocation();

    currentLocation = response;
    return;
  }

  CameraPosition getCameraPosition() {
    return CameraPosition(
      target: LatLng(
        currentLocation?.latitude ?? 37.42796133580664,
        currentLocation?.longitude ?? -122.085749655962,
      ),
      zoom: 14.4746,
    );
  }
}
