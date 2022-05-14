import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'statistics_controller.g.dart';

class StatisticsController = _StatisticsControllerBase
    with _$StatisticsController;

abstract class _StatisticsControllerBase with Store {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://covid19-brazil-api.now.sh/api/report'),
  );

  Future getCountriesData() async {
    try {
      var response = await dio.get('/v1/countries');
      print(response);
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
