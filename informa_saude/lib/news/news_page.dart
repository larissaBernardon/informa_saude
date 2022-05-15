import 'package:flutter/material.dart';

enum CardType {
  twitter,
  fakeNews,
  covid,
  sintomas,
  transmissao,
}

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  static const IconData coronavirusOutlined =
      IconData(0xef88, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Twitter oficial'),
              _buildCardItem(type: CardType.twitter),
              _buildSectionTitle('Notícias'),
              _buildCardItem(type: CardType.fakeNews),
              _buildSectionTitle('COVID-19'),
              _buildCardItem(type: CardType.covid),
              _buildCardItem(type: CardType.sintomas),
              _buildCardItem(type: CardType.transmissao),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildCardTitleNoticias(int index) {
    return const Text(
      'Notícias',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Padding _buildCardItem({required CardType type}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
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
              _buildIcon(type),
              const SizedBox(width: 15),
              _buildCardTitle(type),
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
      ),
    );
  }

  Text _buildCardTitle(CardType type) {
    switch (type) {
      case CardType.covid:
        return _buildTitle('O que é COVID-19?');
      case CardType.sintomas:
        return _buildTitle('Quais são os sintomas?');
      case CardType.transmissao:
        return _buildTitle('Como se transmite?');
      case CardType.twitter:
        return _buildTitle('Ministério da saúde');
      case CardType.fakeNews:
        return _buildTitle('Fake news?');
    }
  }

  Text _buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Container _buildIcon(CardType type) {
    switch (type) {
      case CardType.covid:
        return _buildCardInfo(
          const Color.fromRGBO(209, 210, 255, 1),
          coronavirusOutlined,
          const Color.fromRGBO(108, 110, 219, 1),
        );
      case CardType.sintomas:
        return _buildCardInfo(
          const Color.fromRGBO(214, 246, 255, 1),
          Icons.vaccines_outlined,
          const Color.fromRGBO(0, 157, 199, 1),
        );
      case CardType.transmissao:
        return _buildCardInfo(
          const Color.fromRGBO(242, 227, 233, 1),
          Icons.update_outlined,
          const Color.fromRGBO(157, 76, 108, 1),
        );
      case CardType.twitter:
        return _buildCardInfo(
          const Color.fromRGBO(242, 227, 233, 1),
          Icons.add_to_home_screen_outlined,
          const Color.fromRGBO(157, 76, 108, 1),
        );
      case CardType.fakeNews:
        return _buildCardInfo(
          const Color.fromRGBO(250, 240, 219, 1),
          Icons.newspaper_outlined,
          const Color.fromRGBO(224, 159, 31, 1),
        );
    }
  }

  _buildCardInfo(
    Color color,
    IconData iconData,
    Color iconColor,
  ) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(
        iconData,
        size: 30,
        color: iconColor,
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

  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
