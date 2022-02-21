import 'package:flutter/material.dart';
import 'package:multiple_listener/presentation/page/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('its a first page, nothing happend'),
            MaterialButton(
                child: const Text('go to main page (2)'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SecondPage()));
                }),
          ],
        ),
      ),
    );
  }
}
