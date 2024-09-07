// CameraApp is the Main Application.
import 'dart:async';

import 'package:cam_doctor/screens/diagnostico_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CamScannerScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CamScannerScreen({super.key, required this.cameras});

  @override
  State<CamScannerScreen> createState() => _CamScannerScreenState();
}

class _CamScannerScreenState extends State<CamScannerScreen> {
  late CameraController controller;

  Alignment barAligment = Alignment.bottomCenter;

  Timer? timerPeriodicAnimation;

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });

    timerPeriodicAnimation =
        Timer.periodic(const Duration(milliseconds: 1100), (timer) async {
      setState(() {
        barAligment = barAligment == Alignment.topCenter
            ? Alignment.bottomCenter
            : Alignment.topCenter;
      });

      if (timer.tick == 5) {
        timerPeriodicAnimation?.cancel();

        final photo = await controller
            .takePicture()
            .then((value) async => value.readAsBytes());

        Get.off(() => DiagnosticoScreen(
              photo: photo,
            ));
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timerPeriodicAnimation?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: CameraPreview(controller)),
            Positioned.fill(
                child: Container(
              padding: const EdgeInsets.all(20),
              child: AnimatedAlign(
                alignment: barAligment,
                duration: const Duration(seconds: 1),
                child: const Divider(
                  color: Colors.redAccent,
                  thickness: 5,
                  height: 1,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
