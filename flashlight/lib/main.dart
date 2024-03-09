import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlashLight(),
    );
  }
}

class FlashLight extends StatefulWidget {
  const FlashLight({Key? key}) : super(key: key);

  @override
  State<FlashLight> createState() => _FlashLightState();
}

class _FlashLightState extends State<FlashLight> {
  bool isFlashlightOn = false;
  final torchController = TorchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isFlashlightOn ? Colors.white :Colors.black ,
      body: Container(
        child: Center(
          child: IconButton(
            onPressed: () {
              setState(() {
                isFlashlightOn = !isFlashlightOn;
                torchController.toggle();
              });
            },
            icon: isFlashlightOn
                ? Icon(Icons.flashlight_on, size: 80,)
                : Icon(Icons.flashlight_off_sharp, color: Colors.white, size: 80,)
          ),
        ),
      ),
    );
  }
}
