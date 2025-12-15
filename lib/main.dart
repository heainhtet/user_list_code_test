import 'package:flutter/material.dart';

void main() {
  runApp(const CodeTest());
}

class CodeTest extends StatelessWidget {
  const CodeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(child: Text("Flavor test",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.amber),)),
    ));
  }
}
