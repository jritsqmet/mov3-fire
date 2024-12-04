import 'package:fire_login/screens/listaScreen.dart';
import 'package:flutter/material.dart';

//FIREBASE
import 'package:firebase_database/firebase_database.dart';

class Estudiante extends StatelessWidget {
  const Estudiante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar datos"),
      ),
      body: guardarEstudiante(context),
    );
  }
}

Widget guardarEstudiante(context) {
  TextEditingController cedula = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController edad = TextEditingController();
  TextEditingController ciudad = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: cedula,
        decoration: InputDecoration(
            label: Text("cedula"), border: OutlineInputBorder()),
      ),
      TextField(
        controller: nombre,
        decoration: const InputDecoration(
            label: Text("nombre"), border: OutlineInputBorder()),
      ),
      TextField(
        controller: edad,
        decoration:
            InputDecoration(label: Text("edad"), border: OutlineInputBorder()),
      ),
      TextField(
        controller: ciudad,
        decoration: InputDecoration(
            label: Text("ciudad"), border: OutlineInputBorder()),
      ),
      ElevatedButton(
          onPressed: () { 
            guardar(cedula.text, nombre.text, edad.text, ciudad.text);
            cedula.text=""; nombre.text=""; edad.text=""; ciudad.text="";
          },
          style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 3, 67, 28))),
          child: const Text(
            "Guardar",
            style: TextStyle(fontSize: 30),
          )),

      FilledButton.icon(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaEstudiantes())),
       label: Text("Ver lista"))
    ],
  );
}

Future<void> guardar(cedula, nombre, edad, ciudad) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("estudiantes/"+ cedula);

  await ref.set({
    "nombre": nombre,
    "edad": edad,
    "ciudad": ciudad
  });
}
