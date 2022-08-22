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
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('music home'),
      ),
      body: Container(
        child: const Text('music'),
      ),
    );
  }
}
