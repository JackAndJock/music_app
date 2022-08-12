import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/custom_view/float_view.dart';
import 'package:music_app/main/main_view.dart';
import 'package:music_app/root/root_bloc.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => RootBloc('type')),
        ],
        child: const FloatingView(
          child: MainView(),
        ),
      ),
    );
  }
}
