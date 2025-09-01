import 'package:chatter/app/chatter.dart';
import 'package:chatter/app/di/di.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // initialize GetIt
  runApp(Chatter());
}
