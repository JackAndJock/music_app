// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:music_app/main/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Future<bool> get isFirstLaunch async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool ret = prefs.getBool('FirstLaunch') ?? true;
    if (ret) {
      await prefs.setBool('FirstLaunch', false);
    }
    return ret;
  }

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween(begin: 1.0, end: 1.2).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteManager.root,
          (route) => false,
        );
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isFirstLaunch,
      builder: (context, AsyncSnapshot<bool> snap) {
        if (snap.data == false) {
          return ScaleTransition(
            scale: _animation,
            child: Container(
              color: Colors.amber,
            ),
          );
        }
        return Container(
          color: Colors.deepOrangeAccent.shade100,
        );
      },
    );
  }
}
