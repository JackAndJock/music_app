import 'package:equatable/equatable.dart';

class RootState extends Equatable {
  const RootState({this.type = 'movie'});

  final String type;

  @override
  List<Object?> get props => [type];
}
