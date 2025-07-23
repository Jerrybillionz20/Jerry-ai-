import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jerry AI 🤖🔥'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to Jerry AI!\nChoose a feature to get started.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
