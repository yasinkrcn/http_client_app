import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http_client_app/cards/card.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String _response = '';
  String _statusCode = '';
  String _headers = '';
  String _runtimeType = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpClient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              child: ElevatedButton(
                child: Text('Send HTTP Request'),
                onPressed: () {
                  httpRequest();
                },
              ),
            ),
            AppCard(
              kodu: _statusCode,
              color: Colors.yellow,
              text: 'HTTP Code: ',
            ),AppCard(
              kodu: _runtimeType,
              color: Colors.yellow,
              text: 'Runtime Type: ',
            ),
            // AppCard(kodu: _headers, color: Colors.yellow, text: 'Headers: ', ),
            Expanded(child: SingleChildScrollView(child: Text(_headers))),
            SizedBox(
              height: 50,
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
      ),
    );
  }

  void httpRequest() async {
    try {
      //init http client
      HttpClient client = HttpClient();
      //send a http request
      HttpClientRequest request = await client
          .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      //waiting for response

      HttpClientResponse response = await request.close();

      // print(response.headers);

      // print('--------certificate');
      // print(response.certificate);
      // print('--------compressionState');
      // print(response.compressionState);
      // print('--------connectionInfo');
      // print(response.connectionInfo);
      // print('--------contentLength');
      // print(response.contentLength);
      // print('--------cookies');
      // print(response.cookies);
      // print('--------headers');
      // print(response.headers);
      // print('--------isRedirect');
      // print(response.isRedirect);
      // print('--------persistentConnection');
      // print(response.persistentConnection);
      // print('--------reasonPhrase');
      // print(response.reasonPhrase);
      // print('--------redirects');
      // print(response.redirects);
      // print('--------statusCode');
      // print(response.statusCode);
      // print('--------first');
      // print(response.first);
      // print('--------hashCode');
      // print(response.hashCode);
      // print('--------isBroadcast');
      // print(response.isBroadcast);
      // print('--------isEmpty');
      // print(response.isEmpty);
      // print('--------length');
      // print(response.length);
      // print('--------runtimeType');
      // print(response.runtimeType);
      // print('--------single');
      // print(response.single);

      _statusCode = response.statusCode.toString();

      _headers = response.headers.toString();

      _runtimeType = response.runtimeType.toString();

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
