import 'package:flutter/material.dart';

import 'rick_and_morties/rick_morties.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deeeeeneemee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RickandMorty(),
    );
  }
}
