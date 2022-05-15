import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({
    Key? key,
    required this.headerTitle,
    required this.content,
  }) : super(key: key);

  final String headerTitle;
  final String content;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headerTitle),
        backgroundColor: Colors.deepPurple.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
