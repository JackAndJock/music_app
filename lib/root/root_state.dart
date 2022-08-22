import 'package:equatable/equatable.dart';

import '../constant.dart';

class RootState extends Equatable {
  const RootState({this.type = UnitType.video});

  /// 默认视频
  final UnitType type;

  @override
  List<Object?> get props => [type];

  RootState copyWith({
    UnitType? type,
  }) =>
      RootState(
        type: type ?? this.type,
      );
}
