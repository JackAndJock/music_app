import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/root/root_event.dart';
import 'package:music_app/root/root_state.dart';

import '../constant.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final UnitType type;

  RootBloc(this.type) : super(RootState(type: type)) {
    on<ChangeUnitEvent>(_changeUnit);
  }

  void 

  _changeUnit(
    ChangeUnitEvent event,
    Emitter<RootState> emit,
  ) async {
    emit(state.copyWith(type: event.type));
  }
}
