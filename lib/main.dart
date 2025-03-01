import 'package:flutter/material.dart';
import 'traffic_light.dart'; // นำเข้าไฟล์ที่แยกไว้

void main() {
  runApp(const TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  const TrafficLightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("🚦 Traffic Light Animation"),
          backgroundColor: Colors.deepPurple,
          elevation: 4,
        ),
        body: const Center(
          child: TrafficLight(),
        ),
      ),
    );
  }
}
