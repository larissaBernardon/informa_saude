import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:informa_saude/reportFlow/report_view.dart';
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
  bool get wantKeepAlive => false;

  @override
  void initState() {
    widget.controller.getActiveReports(setState(() {}));
    widget.controller.setMarkersAppearence();
    widget.controller.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        centerTitle: false,
        title: const Text('Situação viral'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          widget.controller.reportListResponse;
          return GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: widget.controller.getInitialPosition(),
            markers: widget.controller.markers,
            onMapCreated: (GoogleMapController controller) {
              widget.controller.googleMapController.complete(controller);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final userBox = Hive.box('user');
          if (userBox.get('email') == null) {
            goToUserDataReportFlow();
          } else {
            goToReportFlow();
          }
        },
        backgroundColor: Colors.deepPurple.shade400,
        label: const Text('Reportar covid'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void goToReportFlow() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportInformationView(
          formFieldTitle: 'Insira o nome da doença',
          buttonTitle: 'Avançar',
          onButtonTapped: (value) {
            widget.controller.sendReport();
            widget.controller.addCovidMarker();
            setState(() {});
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void goToUserDataReportFlow() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportInformationView(
          formFieldTitle: 'Informe seu email',
          buttonTitle: 'Avançar',
          onButtonTapped: (value) {
            // salvar email local
            saveUserDataLocal('email', value);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportInformationView(
                  formFieldTitle: 'Informe seu nome',
                  buttonTitle: 'Avançar',
                  onButtonTapped: (value) {
                    // salvar nome local
                    saveUserDataLocal('nome', value);
                    // navegar para os steps de report
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void saveUserDataLocal(
    String key,
    String value,
  ) {
    final userBox = Hive.box('user');
    userBox.put(key, value);
  }

  void updateState() {
    setState(() {});
  }
}
