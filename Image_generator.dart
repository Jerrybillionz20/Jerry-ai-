import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageGenerator {
  final String apiKey;

  ImageGenerator(this.apiKey);

  Future<String?> generateImage(String prompt) async {
    final url = Uri.parse('https://api.openai.com/v1/images/generations');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': prompt,
        'n': 1,
        'size': '512x512',
      }),
    );

    if (response.statusCode == 200) {
      final
