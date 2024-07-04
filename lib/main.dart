import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English to Kannada Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TranslatorScreen(),
    );
  }
}

class TranslatorScreen extends StatefulWidget {
  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final _controller = TextEditingController();
  final _translator = GoogleTranslator();
  String _translatedText = '';

  void _translateText() async {
    final inputText = _controller.text;
    if (inputText.isNotEmpty) {
      final translation = await _translator.translate(inputText, from: 'en', to: 'kn');
      setState(() {
        _translatedText = translation.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English to Kannada Translator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text in English',
              ),
            ),
            SizedBox(heig
  }
  ht: 20),
            ElevatedButton(
              onPressed: _translateText,
              child: Text('Translate'),
            ),
            SizedBox(height: 20),
            Text(
              _translatedText,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
