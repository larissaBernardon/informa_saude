import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:mobx/mobx.dart';
part 'map_controller.g.dart';

class MapController = _MapController with _$MapController;

abstract class _MapController with Store {
  final Completer<GoogleMapController> googleMapController = Completer();

  @observable
  Observable<Position?> position = Observable(null);

  @action
  Future getCurrentLocation() async {
    var _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    var _permissionStatus = await Geolocator.checkPermission();

    if (_permissionStatus == LocationPermission.denied) {
      _permissionStatus = await Geolocator.requestPermission();
      if (_permissionStatus == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (_permissionStatus == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final positionResponse = await Geolocator.getCurrentPosition();
    position = Observable(positionResponse);
    navigateToPosition();
    return;
  }

  CameraPosition getInitialPosition() {
    return const CameraPosition(
      target: LatLng(
        -30.0277,
        -51.2287,
      ),
      zoom: 14,
    );
  }

  Future<void> navigateToPosition() async {
    final GoogleMapController controller = await googleMapController.future;
    if (position.value != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              position.value!.latitude,
              position.value!.longitude,
            ),
            zoom: 14,
          ),
        ),
      );
    } else {
      print("COULD NOT NAVIGATE BECAUSE POSITION VALUE IS NULL");
    }
  }
}
