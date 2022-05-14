import 'package:flutter/material.dart';
import 'package:informa_saude/statistics/statistics_controller.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final StatisticsController controller;

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  void initState() {
    widget.controller.getCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.yellow,
      ),
    );
  }
}
