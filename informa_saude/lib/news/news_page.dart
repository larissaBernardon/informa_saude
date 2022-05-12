import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  static const IconData coronavirusOutlined =
      IconData(0xef88, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleTwitter(),
            _buildCardsTwitter(),
            _buildTitleNoticias(),
            _buildCardsNoticias(),
            _buildTitleCovid19(),
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

  Widget _buildCardsTwitter() {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => _buildCardItemTwitter(index),
      ),
    );
  }

  Widget _buildCardsNoticias() {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => _buildCardItemNoticias(index),
      ),
    );
  }

  Padding _buildCardItemTwitter(int index) {
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
            _buildCardTitleTwitter(index),
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

  Text _buildCardTitleTwitter(int index) {
    return Text(
      index == 0 ? "O que é COVID-19?" : "",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Padding _buildCardItemNoticias(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Teste()));
          },
          child: Text("Ir para Segunda Página"),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            _buildIcon(index),
            const SizedBox(width: 15),
            _buildCardTitleNoticias(index),
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

  Text _buildCardTitleNoticias(int index) {
    return Text(
      index == 0 ? "O que é COVID-19?" : "",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Padding _buildCardItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
          onTap: () {
            print("tapped on container");
          },
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
          )),
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
        coronavirusOutlined,
        size: 30,
        color: index == 0
            ? const Color.fromRGBO(108, 110, 219, 1)
            : const Color.fromRGBO(0, 157, 199, 1),
      ),
    );
  }

  Padding _buildTitleCovid19() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Text(
        'COVID-19',
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildTitleTwitter() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Text(
        'Twitter Oficial',
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildTitleNoticias() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Text(
        'Notícias',
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
      ),
    );
  }
}
