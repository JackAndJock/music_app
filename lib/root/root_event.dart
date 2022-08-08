import 'package:equatable/equatable.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object?> get props => [];
}

class EventApp extends RootEvent {
  const EventApp();
  
  @override
  List<Object?> get props => [];
}
