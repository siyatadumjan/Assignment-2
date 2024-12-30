import 'package:dashboard_project/app.dart';
import 'package:dashboard_project/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

//Initialize once in the very beginning

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    App(),
  );
}
