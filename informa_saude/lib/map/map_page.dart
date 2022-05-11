import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

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

class MapSampleState extends State<MapWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    ReactionDisposer disposer = reaction(
      (_) => widget.controller.position.value,
      (newPosition) {
        widget.controller.navigateToPosition();
      },
    );

    widget.controller.setMarkersAppearence();

    widget.controller.getCurrentLocation();
    disposer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: widget.controller.getInitialPosition(),
        markers: widget.controller.markers,
        onMapCreated: (GoogleMapController controller) {
          widget.controller.googleMapController.complete(controller);
          setState(() {
            widget.controller.addMarkers();
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.controller.addMarkers();
          setState(() {});
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  void updateState() {
    setState(() {});
  }
}
