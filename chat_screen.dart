import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [];
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  Future<void> sendMessage(String message) async {
    setState(() {
      messages.add({'role': 'user', 'content': message});
      isLoading = true;
    });

    controller.clear();

    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer YOUR_API_KEY_HERE',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "model": "gpt-4",
        "messages": messages,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final reply = data['choices'][0]['message']['content'];
      setState(() {
        messages.add({'role': 'assistant', 'content': reply});
        isLoading = false;
      });
    } else {
      setState(() {
        messages.add({
          'role': 'assistant',
          'content': 'Error: ${response.statusCode}'
        });
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jerry AI Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return Container(
                  padding: EdgeInsets.all(12),
                  alignment: msg['role'] == 'user'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: msg['role'] == 'user'
                          ? Colors.blue[200]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(msg['content'] ?? ""),
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration:
                      InputDecoration(hintText: "Ask Jerry AI anything..."),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                    sendMessage(controller.text.trim());
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
