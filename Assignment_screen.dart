import 'package:flutter/material.dart';
import 'assignment_helper.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final TextEditingController _questionController = TextEditingController();
  String _answer = '';
  bool _loading = false;

  final helper = AssignmentHelper();

  void _solve() async {
    setState(() {
      _loading = true;
      _answer = '';
    });

    final result = await helper.solveAssignment(_questionController.text.trim());

    setState(() {
      _answer = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🧠 Assignment Helper')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Enter your question',
                border: OutlineInputBorder(),
              ),
              minLines: 2,
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _solve,
              child: _loading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Get Answer'),
            ),
            SizedBox(height: 30),
            if (_answer.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _answer,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
