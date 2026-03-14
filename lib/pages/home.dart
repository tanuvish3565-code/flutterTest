import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _urlController = TextEditingController();
  String _result = '';

  Future<void> _fetchData() async {
    setState(() {
      _result = 'Fetching...';
    });
    final url = _urlController.text;
    if (url.isEmpty){
      setState(() {
      _result = 'Please enter a URL';
    });
       return;}

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // List items = jsonDecode(response.body);
        // setState(() {
          
        //   _result = items[0]['name'];
        // });
        final data = jsonDecode(response.body);
        setState(() {
          _result = data['title'];
        });
      } else {
        setState(() {
          _result = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch String Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Fetch String Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  labelText: 'Enter URL',
                  hintText: 'https://example.com',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fetchData,
                child: const Text('Fetch'),
              ),
              const SizedBox(height: 16),
              Text(_result),
            ],
          ),
        ),
      ),
    );
  }
}
