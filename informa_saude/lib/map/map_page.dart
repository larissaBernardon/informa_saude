import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_controller.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MapController controller;

  @override
  State<MapWidget> createState() => MapSampleState();
}

class MapSampleState extends State<MapWidget> {
  final Completer<GoogleMapController> _googleMapController = Completer();

  static const CameraPosition _lakePosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  static const CameraPosition cameraPos = CameraPosition(
    target: LatLng(
      37.42796133580664,
      -122.085749655962,
    ),
    zoom: 14.4746,
  );

  @override
  void initState() {
    widget.controller.getInitialLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: widget.controller.getCameraPosition(),
        onMapCreated: (GoogleMapController controller) {
          _googleMapController.complete(controller);
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _goToTheLake(),
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _googleMapController.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(_lakePosition));
  }
}
