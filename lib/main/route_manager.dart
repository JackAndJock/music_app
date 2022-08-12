// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';

enum PageType {
  root('/root'),
  videoHome('/video_home'),
  videoDetail('/video_detail'),
  videoSearch('/video_search'),
  videoMine('/video_mine'),;

  final String name;
  const PageType(this.name);
}

class RouteManager {
  static const root = '/root';
  static const dramaDetail = '/dramaDetail';
  static const dramaList = '/dramaList';
  static const login = '/login';
  static const fullScreenPlayer = '/fullScreenPlayer';
  static const webPage = '/webPage';
  static const mine = '/mine';
  static const setting = '/setting';
  static const cache = '/cache';
  static const category = '/category';
  static const shortVideo = '/shortVideo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        default:
          return const Scaffold();
      }
    });
  }
}

class CFNavigatorObservers extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
