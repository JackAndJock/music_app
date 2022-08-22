import 'package:flutter/material.dart';
import 'package:music_app/custom_view/float_view.dart';
import 'package:music_app/units/video_unit/video_main.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FloatingView.of(context).showFloating();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: VideoMainPage(),
      ),
    );
  }
}
