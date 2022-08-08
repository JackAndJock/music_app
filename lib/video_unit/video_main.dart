import 'package:flutter/material.dart';

class VideoMainPage extends StatefulWidget {
  const VideoMainPage({Key? key}) : super(key: key);

  @override
  State<VideoMainPage> createState() => _VideoMainPageState();
}

class _VideoMainPageState extends State<VideoMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        child: const Text('video'),
      ),
      floatingActionButton: GestureDetector(
        child: const Icon(Icons.video_call),
        onPanStart: (v) {
          print(v);
        },
      ),
    );
  }
}
