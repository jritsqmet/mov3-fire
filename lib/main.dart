import 'package:fire_login/screens/EstudianteScreen.dart';
import 'package:fire_login/screens/loginScreen.dart';
import 'package:fire_login/screens/registroScreen.dart';
import 'package:flutter/material.dart';

//FIREBASE
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Fire());
}

class Fire extends StatelessWidget {
  const Fire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireBase"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.network(
            "https://4kwallpapers.com/images/walls/thumbs_3t/19860.jpg",
            fit: BoxFit.cover,
          )),
          Center(
            child: Column(
              children: [
                Text("Acceder a la aplicación"),
                FilledButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login())),
                    child: Text("Login")),
                FilledButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Registro())),
                    child: Text("registro")),
                FilledButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Estudiante())),
                    child: Text("Guardar"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
