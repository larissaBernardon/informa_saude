// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatisticsController on _StatisticsControllerBase, Store {
  final _$countriesResponseAtom =
      Atom(name: '_StatisticsControllerBase.countriesResponse');

  @override
  List<Country>? get countriesResponse {
    _$countriesResponseAtom.reportRead();
    return super.countriesResponse;
  }

  @override
  set countriesResponse(List<Country>? value) {
    _$countriesResponseAtom.reportWrite(value, super.countriesResponse, () {
      super.countriesResponse = value;
    });
  }

  final _$statesResponseAtom =
      Atom(name: '_StatisticsControllerBase.statesResponse');

  @override
  List<State>? get statesResponse {
    _$statesResponseAtom.reportRead();
    return super.statesResponse;
  }

  @override
  set statesResponse(List<State>? value) {
    _$statesResponseAtom.reportWrite(value, super.statesResponse, () {
      super.statesResponse = value;
    });
  }

  final _$getCountriesDataAsyncAction =
      AsyncAction('_StatisticsControllerBase.getCountriesData');

  @override
  Future<dynamic> getCountriesData() {
    return _$getCountriesDataAsyncAction.run(() => super.getCountriesData());
  }

  final _$getBrazilStatesDataAsyncAction =
      AsyncAction('_StatisticsControllerBase.getBrazilStatesData');

  @override
  Future<dynamic> getBrazilStatesData() {
    return _$getBrazilStatesDataAsyncAction
        .run(() => super.getBrazilStatesData());
  }

  @override
  String toString() {
    return '''
countriesResponse: ${countriesResponse},
statesResponse: ${statesResponse}
    ''';
  }
}
