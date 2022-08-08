import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/root/root_event.dart';
import 'package:music_app/root/root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final String type;

  RootBloc(this.type) : super(const RootState());
}
