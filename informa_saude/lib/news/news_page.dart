import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  static const IconData coronavirus_outlined =
      IconData(0xef88, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildCards() {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => _buildCardItem(index),
      ),
    );
  }

  Padding _buildCardItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            _buildIcon(index),
            const SizedBox(width: 15),
            _buildCardTitle(index),
          ],
        ),
        height: 115,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(190, 202, 218, 1),
          ),
        ),
      ),
    );
  }

  Text _buildCardTitle(int index) {
    return Text(
      index == 0 ? "O que é COVID-19?" : "Quais são os sintomas?",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Container _buildIcon(int index) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: index == 0
            ? const Color.fromRGBO(209, 210, 255, 1)
            : const Color.fromRGBO(214, 246, 255, 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(
        coronavirus_outlined,
        size: 30,
        color: index == 0
            ? const Color.fromRGBO(108, 110, 219, 1)
            : const Color.fromRGBO(0, 157, 199, 1),
      ),
    );
  }

  Padding _buildTitle() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Text(
        'COVID-19',
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
      ),
    );
  }
}
