import 'package:flutter/material.dart';

void main() {
  runApp(JerryAIApp());
}

class JerryAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jerry AI',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jerry AI 🔥")),
      body: Center(
        child: Text(
          "Welcome to Jerry AI!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
}