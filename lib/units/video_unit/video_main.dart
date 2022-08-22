import 'package:flutter/material.dart';

class VideoMainPage extends StatefulWidget {
  const VideoMainPage({Key? key}) : super(key: key);

  @override
  State<VideoMainPage> createState() => _VideoMainPageState();
}

class _VideoMainPageState extends State<VideoMainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('video home'),
      ),
      body: Container(
        child: const Text('video'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'cat',
          ),
        ],
        onTap: (i) => setState(() {
          index = i;
        }),
      ),
    );
  }
}
