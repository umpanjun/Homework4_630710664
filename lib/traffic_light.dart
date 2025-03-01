import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  _TrafficLightState createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  int _lightState = 0; // 0 = Red, 1 = Yellow, 2 = Green

  void _changeLight() {
    setState(() {
      _lightState = (_lightState + 1) % 3; // วนรอบ 0 -> 1 -> 2 -> 0
    });
  }

  double _getOpacity(int lightIndex) {
    return _lightState == lightIndex ? 1.0 : 0.3;
  }

  Color _getColor(int lightIndex) {
    if (lightIndex == 0) return Colors.red;
    if (lightIndex == 1) return Colors.amber;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              for (int i = 0; i < 3; i++)
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _getOpacity(i),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: _getColor(i),
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (_lightState == i)
                          BoxShadow(
                            color: _getColor(i).withOpacity(0.7),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _changeLight,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 70, 154, 85),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: const Color.fromARGB(255, 255, 151, 77).withOpacity(0.5),
            elevation: 5,
          ),
          child: const Text("เปลี่ยนไฟ 🚥"),
        ),
      ],
    );
  }
}
