import 'package:cam_doctor/screens/accept_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      home: const AcceptScreen(),
      title: 'Recógeme',
      theme: AppTheme.light,
    );
  }
}
