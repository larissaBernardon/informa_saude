// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapController on _MapController, Store {
  final _$positionAtom = Atom(name: '_MapController.position');

  @override
  Observable<Position?> get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Observable<Position?> value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$reportListResponseAtom =
      Atom(name: '_MapController.reportListResponse');

  @override
  List<ReportData>? get reportListResponse {
    _$reportListResponseAtom.reportRead();
    return super.reportListResponse;
  }

  @override
  set reportListResponse(List<ReportData>? value) {
    _$reportListResponseAtom.reportWrite(value, super.reportListResponse, () {
      super.reportListResponse = value;
    });
  }

  final _$getActiveReportsAsyncAction =
      AsyncAction('_MapController.getActiveReports');

  @override
  Future<dynamic> getActiveReports(void callback) {
    return _$getActiveReportsAsyncAction
        .run(() => super.getActiveReports(callback));
  }

  final _$sendReportAsyncAction = AsyncAction('_MapController.sendReport');

  @override
  Future<dynamic> sendReport() {
    return _$sendReportAsyncAction.run(() => super.sendReport());
  }

  final _$getCurrentLocationAsyncAction =
      AsyncAction('_MapController.getCurrentLocation');

  @override
  Future<dynamic> getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  @override
  String toString() {
    return '''
position: ${position},
reportListResponse: ${reportListResponse}
    ''';
  }
}
