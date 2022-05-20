import 'package:informa_saude/models/country.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

import '../models/state.dart';

part 'statistics_controller.g.dart';

class StatisticsController = _StatisticsControllerBase
    with _$StatisticsController;

abstract class _StatisticsControllerBase with Store {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://covid19-brazil-api.now.sh/api/report'),
  );

  @observable
  List<Country>? countriesResponse;

  @observable
  List<State>? statesResponse;

  @action
  Future getCountriesData() async {
    try {
      var response = await dio.get('/v1/countries');
      var responseData = response.data["data"];
      countriesResponse = responseData.map<Country>((country) {
        return Country.fromJson(country);
      }).toList();

      countriesResponse?.forEach((country) {});
    } catch (e) {
      print(e);
    }
  }

  @action
  Future getBrazilStatesData() async {
    try {
      var response = await dio.get('/v1');
      var responseData = response.data["data"];
      statesResponse = responseData.map<State>((state) {
        return State.fromJson(state);
      }).toList();
    } catch (e) {
      print(e);
    }
  }
}
