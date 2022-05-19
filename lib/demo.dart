import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String _response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpClientd'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            child: ElevatedButton(
              child: Text('Send HTTP Request'),
              onPressed: () {
                httpRequest();
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Text(_response),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void httpRequest() async {
    try {
      //init http client
      HttpClient client = HttpClient();
      //send a http request
      HttpClientRequest request = await client
          .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      //waiting for response

      HttpClientResponse response = await request.close();

      print(response.headers);

      _response = await response.transform(utf8.decoder).join();

      client.close();
    } catch (error) {
      //return errors
      _response = 'Error Occurred : $error';
    } finally {
      setState(() {
//rebuild the widgets
      });
    }
  }
}
