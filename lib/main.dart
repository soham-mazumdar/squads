import 'package:flutter/material.dart';
import 'package:squads/app/app.dart';
import 'package:squads/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const App());
}
