import 'package:cam_doctor/screens/cam_scanner_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AcceptScreen extends StatelessWidget {
  const AcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final List<CameraDescription> cameras = await availableCameras();

            Get.to(() => CamScannerScreen(cameras: cameras));
          },
          icon: const Icon(Icons.arrow_forward),
          label: const Text("Next")),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Text(
              "Cam Doctor",
              style: Theme.of(context).textTheme.displayMedium,
            ))),
            LottieBuilder.asset(
              'assets/lotties/Animation - 1722114369848.json',
              height: 200,
              width: 200,
              repeat: false,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'In order to predict your probable diseases, let us capture your face and provide that information to our algorithms.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
