import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/constant.dart';
import 'package:music_app/root/root_bloc.dart';
import 'package:music_app/root/root_event.dart';
import 'burst_menu.dart';
import 'circle.dart';

class FloatingView extends StatefulWidget {
  const FloatingView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  // ignore: library_private_types_in_public_api
  static _FloatingViewState of(BuildContext context) {
    final _FloatingViewState? state =
        context.findAncestorStateOfType<_FloatingViewState>();
    if (state != null) {
      return state;
    }
    throw ErrorWidget('***float view exception***');
  }

  @override
  State<FloatingView> createState() => _FloatingViewState();
}

class _FloatingViewState extends State<FloatingView>
    with SingleTickerProviderStateMixin {
  bool show = false;
  late Offset offset;

  late AnimationController _ctrl;

  final double width = 200;
  final double height = 30;
  final double outWidth = 40;
  final double boxHeight = 110;

  final double radius = 60;
  OverlayEntry? entry;
  double showWidth = 0;

  bool out = false;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..addListener(_listenAnimate);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var px = MediaQuery.of(context).size.width - 100;
      var py = MediaQuery.of(context).size.height * 0.05;
      offset = Offset(px, py);

      entry = OverlayEntry(
        builder: (context) => Stack(
          children: <Widget>[
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: _buildFloating(),
            ),
          ],
        ),
      );
      showFloating();
    });
  }

  final double circleRadius = 80;
  final double menuSize = 36;

  Widget _buildFloating() {
    Color wrapColor = Colors.blue.withOpacity(0.6);
    bool left = offset.dx < 100;

    return Container(
      width: circleRadius * 2,
      height: circleRadius * 2,
      alignment: Alignment.center,
      color: Colors.green,
      child: IconTheme(
        data: IconTheme.of(context).copyWith(color: Colors.white, size: 18),
        child: BurstMenu(
            startAngle: !left ? 90.0 + 15 : -90 - 15.0 + 180,
            swapAngle: !left ? 180.0 - 15 * 2 : -(180.0 - 15 * 2),
            center: _buildCenter(),
            burstMenuItemClick: _burstMenuItemClick,
            menus: _buildMenuItems(wrapColor)),
      ),
    );
  }

  Widget _buildCenter() => GestureDetector(
        onPanEnd: _onPanEnd,
        onPanUpdate: _updatePosition,
        child: Opacity(
          opacity: 0.9,
          child: Container(
            width: menuSize,
            height: menuSize,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(menuSize / 2)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  // image: const DecorationImage(
                  //     image: AssetImage('assets/images/icon_head.webp')),
                  borderRadius: BorderRadius.circular(menuSize / 2)),
            ),
          ),
        ),
      );

  // 构建 菜单 item
  List<Widget> _buildMenuItems(Color wrapColor) => [
        Circle(color: wrapColor, child: const Icon(Icons.close)),
        Circle(color: wrapColor, child: const Icon(Icons.movie)),
        Circle(color: wrapColor, child: const Icon(Icons.music_note)),
        Circle(color: wrapColor, child: const Icon(Icons.settings)),
      ];

  bool _burstMenuItemClick(int index) {
    switch (index) {
      case 0:
        _doClose();
        break;
      case 1:
        _toVideoUnit();
        break;
      case 2:
        _toMusicUnit();
        break;
      case 3:
        _toSetting();
        break;
    }

    return true;
  }

  // 处理 菜单 item 点击事件
  void _toSetting() {
    // Navigator.of(context).pushNamed(UnitRouter.setting);
  }

  void _toVideoUnit() {
    BlocProvider.of<RootBloc>(context).add(
      const ChangeUnitEvent(UnitType.video),
    );
  }

  void _toMusicUnit() {
    BlocProvider.of<RootBloc>(context).add(
      const ChangeUnitEvent(UnitType.music),
    );
  }

  void _toPoint() {
    // BlocProvider.of<PointBloc>(context).add(EventLoadPoint());
    // Navigator.of(context).pushNamed(UnitRouter.point);
  }

  void _doClose() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  double endX = 0;

  void _onPanEnd(details) {
    endX = offset.dx;
    _ctrl.reset();
    _ctrl.forward();
  }

  void _listenAnimate() {
    // var px = MediaQuery.of(context).size.width - (outWidth);
    // offset = Offset(px - (_ctrl.value), offset.dy);
    double px;
    // print(offset.dx);
    if (offset.dx > MediaQuery.of(context).size.width / 2 - circleRadius) {
      double begin = endX;
      double end =
          MediaQuery.of(context).size.width - menuSize / 2 - circleRadius;
      double t = _ctrl.value;
      px = begin + (end - begin) * t; // x = menuSize / 2 - circleRadius;

    } else {
      double begin = endX;
      double end = menuSize / 2 - circleRadius;
      double t = _ctrl.value;
      px = begin + (end - begin) * t; // x = menuSize / 2 - circleRadius;
    }

    offset = Offset(px, offset.dy);
    entry?.markNeedsBuild();
  }

  void _updatePosition(DragUpdateDetails details) {
    double y = details.globalPosition.dy - circleRadius;
    double x = details.globalPosition.dx - circleRadius;
    if (x < menuSize / 2 - circleRadius) {
      x = menuSize / 2 - circleRadius;
    }

    if (y < menuSize / 2 - circleRadius) {
      y = menuSize / 2 - circleRadius;
    }

    if (x > MediaQuery.of(context).size.width - menuSize / 2 - circleRadius) {
      x = MediaQuery.of(context).size.width - menuSize / 2 - circleRadius;
    }

    if (y > MediaQuery.of(context).size.height - menuSize / 2 - circleRadius) {
      y = MediaQuery.of(context).size.height - menuSize / 2 - circleRadius;
    }
    offset = Offset(x, y);
    entry?.markNeedsBuild();
  }

  void showFloating() {
    if (!show && entry != null) {
      Overlay.of(context)?.insert(entry!);
      show = true;
    }
  }

  void hideFloating() {
    if (show) {
      entry?.remove();
      show = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
