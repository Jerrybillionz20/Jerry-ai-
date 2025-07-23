import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jerry AI 🤖🔥'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Jerry AI!\nChoose a feature to get started:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () => _showComingSoon(context, '🧠 Assignment Helper'),
              icon: Icon(Icons.school),
              label: Text('Assignment Helper'),
            ),
            SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () => _showComingSoon(context, '📸 Image Generator'),
              icon: Icon(Icons.image),
              label: Text('Image Generator'),
            ),
            SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () => _showComingSoon(context, '🎥 Video Generator'),
              icon: Icon(Icons.movie),
              label: Text('Video Generator'),
            ),
            SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () => _showComingSoon(context, '🎤 Voice Assistant'),
              icon: Icon(Icons.mic),
              label: Text('Voice Assistant'),
            ),
          ],
        ),
      ),
    );
  }
}
ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AssignmentScreen()),
      );
    },
    child: Text("📚 Assignment Helper"),
  ),
