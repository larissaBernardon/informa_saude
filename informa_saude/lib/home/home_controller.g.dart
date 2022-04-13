// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool>? _$isStatisticsSelectedComputed;

  @override
  bool get isStatisticsSelected => (_$isStatisticsSelectedComputed ??=
          Computed<bool>(() => super.isStatisticsSelected,
              name: '_HomeController.isStatisticsSelected'))
      .value;
  Computed<bool>? _$isMapSelectedComputed;

  @override
  bool get isMapSelected =>
      (_$isMapSelectedComputed ??= Computed<bool>(() => super.isMapSelected,
              name: '_HomeController.isMapSelected'))
          .value;
  Computed<bool>? _$isNewsSelectedComputed;

  @override
  bool get isNewsSelected =>
      (_$isNewsSelectedComputed ??= Computed<bool>(() => super.isNewsSelected,
              name: '_HomeController.isNewsSelected'))
          .value;
  Computed<bool>? _$isProfileSelectedComputed;

  @override
  bool get isProfileSelected => (_$isProfileSelectedComputed ??= Computed<bool>(
          () => super.isProfileSelected,
          name: '_HomeController.isProfileSelected'))
      .value;

  final _$_oldPageSelectedAtom = Atom(name: '_HomeController._oldPageSelected');

  int get oldPageSelected {
    _$_oldPageSelectedAtom.reportRead();
    return super._oldPageSelected;
  }

  @override
  int get _oldPageSelected => oldPageSelected;

  @override
  set _oldPageSelected(int value) {
    _$_oldPageSelectedAtom.reportWrite(value, super._oldPageSelected, () {
      super._oldPageSelected = value;
    });
  }

  final _$_pageSelectedAtom = Atom(name: '_HomeController._pageSelected');

  int get pageSelected {
    _$_pageSelectedAtom.reportRead();
    return super._pageSelected;
  }

  @override
  int get _pageSelected => pageSelected;

  @override
  set _pageSelected(int value) {
    _$_pageSelectedAtom.reportWrite(value, super._pageSelected, () {
      super._pageSelected = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void onPageSelected(int index) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.onPageSelected');
    try {
      return super.onPageSelected(index);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isStatisticsSelected: ${isStatisticsSelected},
isMapSelected: ${isMapSelected},
isNewsSelected: ${isNewsSelected},
isProfileSelected: ${isProfileSelected}
    ''';
  }
}
