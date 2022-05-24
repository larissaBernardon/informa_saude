import 'package:flutter/material.dart';
import 'package:informa_saude/news/card_detail.dart';

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
              _buildCardItem(context: context, type: CardType.twitter),
              _buildSectionTitle('Notícias'),
              _buildCardItem(context: context, type: CardType.fakeNews),
              _buildSectionTitle('COVID-19'),
              _buildCardItem(context: context, type: CardType.covid),
              _buildCardItem(context: context, type: CardType.sintomas),
              _buildCardItem(context: context, type: CardType.transmissao),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildCardItem({
    required BuildContext context,
    required CardType type,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () => _navigateToRoute(context: context, type: type),
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

  void _navigateToRoute({
    required BuildContext context,
    required CardType type,
  }) {
    var headerTitle = '';
    var content = '';

    if (type == CardType.covid) {
      headerTitle = 'O que é COVID-19?';
      content =
          'Os coronavírus são uma grande família de vírus comuns em muitas espécies diferentes de animais, incluindo camelos, gado, gatos e morcegos. Raramente, os coronavírus que infectam animais podem infectar pessoas, como exemplo do MERS-CoV e SARS-CovV.\n\nRecentemente, em dezembro de 2019, houve a transmissão de um novo coronavírus (SARS-CoV-2), o qual foi identificado em Wuhan na China e causou a COVID-19, sendo em seguida disseminada e transmitida pessoa a pessoa.\n\nA COVID-19 é uma doença causada pelo coronavírus, denominado SARS-CoV-2, que apresenta um espectro clínico variando de infecções assintomáticas a quadros graves. De acordo com a Organização Mundial de Saúde, a maioria (cerca de 80%) dos pacientes com COVID-19 podem ser assintomáticos ou oligossintomáticos (poucos sintomas), e aproximadamente 20% dos casos detectados requer atendimento hospitalar por apresentarem dificuldade respiratória, dos quais aproximadamente 5% podem necessitar de suporte ventilatório.';
    }

    if (type == CardType.sintomas) {
      headerTitle = 'Quais são os sintomas?';
      content =
          'Caso assintomático: caracterizado por teste laboratorial positivo para covid-19 e ausência de sintomas;\n\nCaso leve: caracterizado a partir da presença de sintomas não específicos, como tosse, dor e garganta ou coriza, seguido, ou não, de perda de olfato e paladar, diarreia, dor abdominal, febre, calafrios, mialgia, fadiga e/ou cefaleia;\n\nCaso moderado: os sintomas mais frequentes podem incluir desde sinais leves da doença, como tosse persistente e febre persistente diária, até sinais de piora progressiva de outro sintoma relacionado à covid-19 (fraqueza, prostração, falta de apetite, diarreia), além da presença de pneumonia sem sinais ou sintomas de gravidade; \n\nCaso grave: considera-se a Síndrome Respiratória Aguda Grave (Síndrome Gripal que apresente dificuldade de respirar, desconforto respiratório ou pressão persistente no tórax ou saturação de oxigênio menor que 95% em ar ambiente ou coloração azulada de lábios ou rosto;\n\nCaso crítico: os principais sintomas são sepse, síndrome do desconforto respiratório agudo, síndrome do desconforto respiratório agudo, insuficiência respiratória grave, disfunção de múltiplos órgãos, pneumonia grave, necessidade de suporte respiratório e internações em unidades de terapia intensiva.\n\nPara crianças, os principais sintomas incluem aceleração o ritmo respiratório, baixa saturação de oxigenação no sangue, desconforto respiratório, alteração da consciência, desidratação, dificuldade para se alimentar, coloração azulada, letargia, convulsões, recusa alimentar.';
    }

    if (type == CardType.transmissao) {
      headerTitle = 'Como se transmite?';
      content =
          'Formas de Transmissão\n\nA transmissão dos coronavírus costuma ocorrer pelo ar ou por contato pessoal com secreções contaminadas, como:\nGotículas de saliva;\nEspirro;\nTosse;\nCatarro;\nContato pessoal próximo, como toque ou aperto de mão;\nContato com objetos ou superfícies contaminadas, seguido de contato com a boca, nariz ou olhos.\n\nPeríodo de Incubação\n\nO período médio de incubação por coronavírus é de 05 dias, com intervalos que chegam a 12 dias, período em que os primeiros sintomas levam para aparecer desde a infecção.\n\nTransmissibilidade\n\nA transmissibilidade dos pacientes infectados por SARSCoV é em média de 07 dias após o início dos sintomas. No entanto, dados preliminares do coronavírus (SARS-CoV-2) sugerem que a transmissão possa ocorrer mesmo sem o aparecimento de sinais e sintomas.\n\nAté o momento, não há informações suficientes de quantos dias anteriores ao início dos sinais e sintomas uma pessoa infectada passa a transmitir o vírus.';
    }

    if (type != CardType.twitter && type != CardType.fakeNews) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CardDetail(
            headerTitle: headerTitle,
            content: content,
          ),
        ),
      );
    } else {
      // se for um dos dois abre url
    }
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

  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w600,
          fontFamily: '',
        ),
      ),
    );
  }
}
