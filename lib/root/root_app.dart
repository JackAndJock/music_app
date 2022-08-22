import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/constant.dart';
import 'package:music_app/custom_view/float_view.dart';
import 'package:music_app/root/root_bloc.dart';
import 'package:music_app/root/root_state.dart';
import 'package:music_app/units/music_unit/music_main.dart';
import 'package:music_app/units/video_unit/video_main.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RootBloc(UnitType.video);
      },
      child: MaterialApp(
        home: FloatingView(
          child: BlocBuilder<RootBloc, RootState>(
            builder: (context, state) {
              print(state.type);
              switch (state.type) {
                case UnitType.video:
                  return const VideoMainPage();
                case UnitType.music:
                  return const MusicMainPage();
                default:
              }
              return Container(
                color: Colors.lightBlue,
              );
            },
          ),
        ),
      ),
    );
  }
}
