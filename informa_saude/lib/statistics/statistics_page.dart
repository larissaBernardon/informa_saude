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
    //widget.controller.getCountriesData();
    widget.controller.getBrazilStatesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: _buildAppBar(),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // _buildBrazilCards(),
          // _buildGlobalCards(),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      height: 100,
      width: 100,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _buildTitle(),
      centerTitle: false,
      flexibleSpace: _buildFlexibleSpace(),
      backgroundColor: Colors.deepPurple.shade400,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(150),
          bottomRight: Radius.circular(100),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Estatísticas',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFlexibleSpace() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/man.png'), fit: BoxFit.scaleDown),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/flower.png'),
                  fit: BoxFit.scaleDown),
            ),
          )
        ],
      ),
    );
  }
}
