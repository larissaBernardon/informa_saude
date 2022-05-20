import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:informa_saude/statistics/statistics_controller.dart';
import '../models/state.dart' as Model;

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final StatisticsController controller;

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    widget.controller.getCountriesData();
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
      body: Observer(
        builder: (BuildContext context) {
          if (widget.controller.countriesResponse != null &&
              widget.controller.statesResponse != null) {
            return _buildContentState();
          } else {
            return _buildLoadingState();
          }
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Padding(
      padding: EdgeInsets.only(top: 300),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildContentState() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 380,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Dados Globais',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15),
              scrollDirection: Axis.horizontal,
              child: _buildGlobalIcons(),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Dados Nacionais',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 15,
                top: 10,
                bottom: 10,
              ),
              scrollDirection: Axis.horizontal,
              child: _buildNationalInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlobalIcons() {
    // random countries
    widget.controller.countriesResponse!.shuffle();
    return Row(
      children: List.generate(
        widget.controller.countriesResponse!.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage(
                    _getAssetForCountry(index),
                  ),
                ),
                borderRadius: BorderRadius.circular(50),
                color: Colors.deepPurple,
              ),
            ),
          );
        },
      ),
    );
  }

  String _getAssetForCountry(int index) {
    try {
      return 'assets/${widget.controller.countriesResponse?[index].country}.png';
    } catch (error) {
      return 'assets/background.png';
    }
  }

  Widget _buildNationalInfo() {
    return Row(
      children: List.generate(
        10,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 15),
          child: StateCard(
            state: widget.controller.statesResponse![index],
          ),
        ),
      ),
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
                image: AssetImage('assets/man.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/flower.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StateCard extends StatelessWidget {
  const StateCard({
    Key? key,
    required this.state,
  }) : super(key: key);

  final Model.State state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.8),
            spreadRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  state.state ?? 'state',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.verified_outlined,
                  color: Colors.green,
                ),
                Text(
                  'Casos:',
                  style: _buildTextStyle(),
                ),
                Text(
                  '${state.cases}',
                  style: _buildTextStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.pending_actions_outlined,
                  color: Colors.orange,
                ),
                Text(
                  'Suspeitas:',
                  style: _buildTextStyle(),
                ),
                Text(
                  '${state.suspects}',
                  style: _buildTextStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.dangerous_outlined,
                  color: Colors.black,
                ),
                Text(
                  'Mortes:',
                  style: _buildTextStyle(),
                ),
                Text(
                  '${state.deaths}',
                  style: _buildTextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return const TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
  }
}
