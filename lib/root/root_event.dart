import 'package:equatable/equatable.dart';
import 'package:music_app/constant.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object?> get props => [];
}

class ChangeUnitEvent extends RootEvent {
  final UnitType type;

  const ChangeUnitEvent(this.type);

  @override
  List<Object?> get props => [type];
}
