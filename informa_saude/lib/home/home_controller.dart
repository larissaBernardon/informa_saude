import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @readonly
  int _oldPageSelected = 0;

  @readonly
  int _pageSelected = 0;

  @computed
  bool get isStatisticsSelected => _pageSelected == statisticsPageId;

  @computed
  bool get isMapSelected => _pageSelected == mapPageId;

  @computed
  bool get isNewsSelected => _pageSelected == newsPageId;

  @computed
  bool get isProfileSelected => _pageSelected == profilePageId;

  static const int statisticsPageId = 0;
  static const int mapPageId = 1;
  static const int newsPageId = 2;
  static const int profilePageId = 3;

  int get getStatisticsId => statisticsPageId;
  int get getMapId => mapPageId;
  int get getNewsId => newsPageId;
  int get getProfileId => profilePageId;

  @action
  void onPageSelected(int index) {
    _oldPageSelected = _pageSelected;
    _pageSelected = index;
  }
}
