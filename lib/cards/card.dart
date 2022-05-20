import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required String kodu,
    required this.color, required this.text,
  })  : _kodu = kodu,
        super(key: key);

  final String _kodu;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            '${text} ${_kodu}',
            style: TextStyle(fontSize: 18),
          ))),
    );
  }
}
