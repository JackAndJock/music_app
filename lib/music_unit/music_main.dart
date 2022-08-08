import 'package:flutter/material.dart';

class MusicMainPage extends StatefulWidget {
  const MusicMainPage({Key? key}) : super(key: key);

  @override
  State<MusicMainPage> createState() => _MusicMainPageState();
}

class _MusicMainPageState extends State<MusicMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: const Text('music'),
      ),
      floatingActionButton: GestureDetector(
        child: const Icon(Icons.music_note),
        onPanStart: (v) {
          print(v);
        },
      ),
    );
  }
}
