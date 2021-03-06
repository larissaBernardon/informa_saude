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
  bool firstReport = true;

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
          screenTitle: "Informe a doença",
          formFieldTitle: 'Insira o nome da doença',
          buttonTitle: 'Avançar',
          onButtonTapped: (value) {
            widget.controller.addCovidMarker();
            setState(() {});

            int count = 0;
            var max = firstReport ? 3 : 1;
            Navigator.of(context).popUntil((_) => count++ >= max);
            firstReport = false;

            const snackBar = SnackBar(
              backgroundColor: Colors.green,
              content: Text('Report adicionado com sucesso!'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          screenTitle: "1. Informe seu email",
          formFieldTitle: 'Informe seu email',
          buttonTitle: 'Avançar',
          onButtonTapped: (value) async {
            saveUserDataLocal('email', value);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportInformationView(
                  screenTitle: "2. Informe seu nome",
                  formFieldTitle: 'Informe seu nome completo',
                  buttonTitle: 'Avançar',
                  onButtonTapped: (value) {
                    saveUserDataLocal('nome', value);
                    goToReportFlow();
                    // int count = 0;
                    // Navigator.of(context).popUntil((_) => count++ >= 3);

                    // const snackBar = SnackBar(
                    //   backgroundColor: Colors.green,
                    //   content: Text('Report adicionado com sucesso!'),
                    // );

                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
