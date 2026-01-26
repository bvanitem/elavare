import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elavare/constants.dart';

void main() => runApp(const Elavare());

class Elavare extends StatelessWidget {
  const Elavare({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Elavare';
    return MaterialApp(
      title: 'Elavare',
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}