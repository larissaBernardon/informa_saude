import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:informa_saude/models/report.dart';
import 'dart:async';
import 'package:mobx/mobx.dart';
part 'map_controller.g.dart';

class MapController = _MapController with _$MapController;

abstract class _MapController with Store {
  final Completer<GoogleMapController> googleMapController = Completer();
  late BitmapDescriptor markerIcon;

  @observable
  Observable<Position?> position = Observable(null);

  Set<Marker> markers = {};

  @observable
  List<ReportData>? reportListResponse;

  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://informa-saude.herokuapp.com'),
  );

  @action
  Future getActiveReports(void callback) async {
    try {
      final response = await dio.get("/report/ativos");
      final responseList = response.data["report"] as List;
      reportListResponse = responseList
          .map((reportJson) => ReportData.fromJson(reportJson))
          .toList();
      addMarkers();
      callback;
    } catch (error) {
      print(error);
    }
  }

  @action
  Future sendReport() async {
    try {
      final userBox = Hive.box('user');
      var params = {
        "reporter": "${userBox.get('email')}",
        "latitude": "${position.value?.latitude.toInt()}",
        "longitude": "${position.value?.longitude.toInt()}",
        "report_type": 1,
        "confirmed": 1,
        "active": 1
      };

      // await dio.post("/report", data: jsonEncode(params));
    } catch (error) {
      print(error);
    }
  }

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
            zoom: 16,
          ),
        ),
      );
    } else {
      print("COULD NOT NAVIGATE BECAUSE POSITION VALUE IS NULL");
    }
  }

  void addMarkers() {
    reportListResponse?.forEach(
      (reportData) {
        markers.add(
          Marker(
            icon: markerIcon,
            markerId: MarkerId("${reportData.id}"),
            position: LatLng(reportData.latitude.toDouble(),
                reportData.longitude.toDouble()),
            alpha: 0.4,
          ),
        );
      },
    );
  }

  void addCovidMarker() async {
    await setMarkersAppearence();

    markers.add(
      Marker(
        icon: markerIcon,
        markerId: const MarkerId('id'),
        position: const LatLng(
          -30.03527617376084,
          -51.226622829414026,
        ),
        alpha: 0.4,
      ),
    );
  }

  Future setMarkersAppearence() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size.square(10)),
      'assets/raio.png',
    );
  }
}
