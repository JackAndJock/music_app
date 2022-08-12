import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../root/root_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  runApp(const RootApp());
}
