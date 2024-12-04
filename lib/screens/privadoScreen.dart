import 'package:flutter/material.dart';

class Privado extends StatelessWidget {
  const Privado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privado"),
      ),
      body: Image.network("https://4kwallpapers.com/images/walls/thumbs_3t/16722.jpg"),
    );
  }
}