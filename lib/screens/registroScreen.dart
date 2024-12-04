import 'package:fire_login/screens/loginScreen.dart';
import 'package:flutter/material.dart';

//FIREBASE
import 'package:firebase_auth/firebase_auth.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: formulario(context),
    );
  }
}


Widget formulario (context){
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  return Column(
    children: [
      Text("REGISTRO"),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: email,
          decoration: InputDecoration(
            label: Text("CORREO"),
            border: OutlineInputBorder()
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: true,
          controller: pass,
          decoration: InputDecoration(
            label: Text("PASSWORD"),
            border:OutlineInputBorder()
          ),
        ),
      ),

      ElevatedButton.icon(onPressed: ()=>registro(context, email.text, pass.text), label: Text("Registro"), icon: Icon(Icons.app_registration),)

    ],
  );

}
Future<void> registro(context, email, pass) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: pass,
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}