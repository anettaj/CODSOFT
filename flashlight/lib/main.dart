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
      title: 'FlashLight',
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
  final TorchController torchController = TorchController();

  @override
  void initState() {
    super.initState();
    initFlashlight();
  }

  @override
  void dispose() {
    torchController.toggle(); // Turn off the flashlight
    super.dispose();
  }

  Future<void> initFlashlight() async {
    try {
      bool? hasFlash = await torchController.hasTorch;

      if (hasFlash != null && !hasFlash) {

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No Flashlight Available'),
            content: Text('This device does not have a camera flash.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Failed to initialize flashlight: $e');
    }
  }

  Future<void> toggleFlashlight() async {
    try {
      setState(() {
        isFlashlightOn = !isFlashlightOn;
      });

      await torchController.toggle();
    } catch (e) {
      print('Failed to toggle flashlight: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isFlashlightOn ? Colors.white : Colors.black,
      body: Container(
        child: Center(
          child: IconButton(
            onPressed: toggleFlashlight,
            icon: isFlashlightOn
                ? Icon(Icons.flashlight_on, size: 80,)
                : Icon(Icons.flashlight_off_sharp, color: Colors.white, size: 80,),
          ),
        ),
      ),
    );
  }
}
