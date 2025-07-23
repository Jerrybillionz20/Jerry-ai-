import 'dart:convert';
import 'package:http/http.dart' as http;

class AssignmentHelper {
  final String apiKey;

  AssignmentHelper(this.apiKey);

  Future<String> solveHomework(String question) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "
