import 'dart:math';
import 'dart:typed_data';

import 'package:cam_doctor/theme/app_theme.dart';
import 'package:cam_doctor/entities/disease_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

enum EtapaScaneo { analizando, escaneado }

class DiagnosticoScreen extends StatefulWidget {
  final Uint8List photo;

  const DiagnosticoScreen({super.key, required this.photo});

  @override
  State<DiagnosticoScreen> createState() => _DiagnosticoScreenState();
}

class _DiagnosticoScreenState extends State<DiagnosticoScreen> {
  EtapaScaneo _etapa = EtapaScaneo.analizando;

  late Disease _diseaseSelected;

  Text get _face {
    late String string;

    if (_diseaseSelected.face == FaceDisease.good) {
      string = "😀";
    }
    if (_diseaseSelected.face == FaceDisease.soso) {
      string = "🙂";
    }
    if (_diseaseSelected.face == FaceDisease.bad) {
      string = "🥲";
    }
    if (_diseaseSelected.face == FaceDisease.crazy) {
      string = "🥴";
    }

    return Text(
      string,
      style: const TextStyle(fontSize: 40, color: Colors.black),
    );
  }

  ColorFilter get _getColorFilter {
    if (_etapa == EtapaScaneo.analizando) {
      return const ColorFilter.mode(Colors.indigo, BlendMode.color);
    }

    if (_etapa == EtapaScaneo.escaneado) {
      if (_diseaseSelected.face == FaceDisease.bad) {
        return const ColorFilter.matrix([
          0.2126, 0.7152, 0.0722, 0, 0, // Rojo
          0.2126, 0.7152, 0.0722, 0, 0, // Verde
          0.2126, 0.7152, 0.0722, 0, 0, // Azul
          0, 0, 0, 1, 0, // Alpha
        ]);
      }

      if (_diseaseSelected.face == FaceDisease.crazy) {
        return ColorFilter.mode(
            Colors.purpleAccent.withOpacity(0.5), BlendMode.modulate);
      }
    }

    return const ColorFilter.mode(Colors.transparent, BlendMode.color);
  }

  @override
  void initState() {
    super.initState();

    _diseaseSelected = diseases[Random().nextInt(33)];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<int>(
        future: Future.delayed(const Duration(seconds: 10)).then((value) {
          _etapa = EtapaScaneo.escaneado;

          return 1;
        }),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Positioned.fill(
                child: ColorFiltered(
                    colorFilter: _getColorFilter,
                    child: Image.memory(
                      widget.photo,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                  left: 20,
                  top: 40,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  )),
              if (!snapshot.hasData)
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "we are creating a diagnosis...",
                          style: TextStyle(
                              color: AppTheme.primaryColor, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      LottieBuilder.asset(
                        "assets/lotties/Animation - 1725747345098.json",
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              if (snapshot.hasData)
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Diagnosis',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              _face,
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  _diseaseSelected.disease,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: _diseaseSelected.face ==
                                              FaceDisease.bad
                                          ? Colors.red
                                          : null),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
