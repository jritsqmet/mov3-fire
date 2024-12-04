import 'package:fire_login/screens/privadoScreen.dart';
import 'package:flutter/material.dart';

//FIREBASE
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: formulario(context),
    );
  }
}

Widget formulario(context) {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  return Column(
    children: [
      Text("Login"),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(fontSize: 30),
          controller: email,
          decoration: InputDecoration(
              label: Text("CORREO", style: TextStyle( fontSize: 30),), 
              
              border: OutlineInputBorder()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(fontSize: 30),
          obscureText: true,
          controller: pass,
          decoration: InputDecoration(
              label: Text("PASSWORD", style: TextStyle(fontSize: 30),), 
              border: OutlineInputBorder()),
              
        ),
      ),
      ElevatedButton.icon(
        onPressed: () => login(context, email.text, pass.text),
        label: Text("Login"),
        icon: Icon(Icons.login),
      )
    ],
  );
}

Future<void> login(context, email, pass) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Privado()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
