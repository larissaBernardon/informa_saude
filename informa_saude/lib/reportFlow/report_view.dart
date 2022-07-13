import 'package:flutter/material.dart';

class ReportInformationView extends StatelessWidget {
  ReportInformationView({
    required this.formFieldTitle,
    required this.buttonTitle,
    required this.screenTitle,
    required this.onButtonTapped,
    Key? key,
  }) : super(key: key);

  final String formFieldTitle;
  final String buttonTitle;
  final String screenTitle;
  final Function(String value) onButtonTapped;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              screenTitle,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: formFieldTitle,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              height: 44,
              child: Center(
                child: TextButton(
                  child: Text(
                    buttonTitle,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => onButtonTapped(textController.text),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
