import 'package:informa_saude/models/country.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'statistics_controller.g.dart';

class StatisticsController = _StatisticsControllerBase
    with _$StatisticsController;

abstract class _StatisticsControllerBase with Store {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://covid19-brazil-api.now.sh/api/report'),
  );

  @observable
  ObservableFuture<List<Country>?> countriesResponse =
      ObservableFuture.value(null);

  @action
  Future getCountriesData() async {
    try {
      var response = await dio.get('/v1/countries');
      var responseData = response.data["data"];
      countriesResponse = ObservableFuture.value(responseData.map((country) {
        print(country);
        return Country.fromJson(country);
      }).toList());

      print(countriesResponse.value?.first.country);
    } catch (e) {
      print(e);
    }
  }

  Future getBrazilStatesData() async {
    try {
      var response = await dio.get('/v1');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
