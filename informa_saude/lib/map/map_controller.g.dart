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

  final _$getCurrentLocationAsyncAction =
      AsyncAction('_MapController.getCurrentLocation');

  @override
  Future<dynamic> getCurrentLocation({required Function completion}) {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation(completion: completion));
  }

  @override
  String toString() {
    return '''
position: ${position}
    ''';
  }
}
