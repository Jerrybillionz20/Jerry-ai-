import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  void _sendMessage() {
    String userInput = _controller.text.trim();
    if (userInput.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': userInput});
      _messages.add({'role': 'ai', 'text': _generateFakeReply(userInput)});
    });

    _controller.clear();
  }

  String _generateFakeReply(String prompt) {
    // This is just a placeholder — later we’ll connect it to real AI
    return "I'm Jerry AI and I see you said: \"$prompt\" 🤖";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🧠 Jerry AI Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ListTile(
                  title: Text(
                    msg['text']!,
                    textAlign: msg['role'] == 'user'
                        ? TextAlign.right
                        : TextAlign.left,
                    style: TextStyle(
                      color: msg['role'] == 'user' ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
